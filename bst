"""
@author = Tugay KAĞAN
"""

import java.util.Scanner;

class Node{
	int key;
	Node left;
	Node right;
	Node parent;
	public Node(int data){
		this.key = data;
		left = null;
		right = null;
		parent = null;
		
	}
}

public class BinarySearchTree {
	public static Node root;
	public BinarySearchTree(){
		this.root = null;
	}
	
	
	public void insert(int id){//id == kitaptaki z
		Node z = new Node(id);
		if(root==null){
			root = z;
			return;
		}		
		Node parent = null; //parent == kitaptaki y
		Node current = root; // current ==  kitaptaki x
		while(current != null){
			parent = current;
			if(id<current.key){				
				current = current.left;
			}
			else{
				current = current.right;
			}
		}
		z.parent = parent;
		if(parent == null){
			root = z;
		}
		else{
			if(z.key < parent.key){
				parent.left = z;
			}
			else{
				parent.right = z;
			}
		}
		
	}
	
	
	public static Node search(Node x,int k){
		
		if(x == null || k == x.key){
			return x;
		}
		if(k < x.key)
			return search(x.left,k);
		else
			return search(x.right,k);	
	}	

	
	public Node delete(int id){
		Node z = search(root,id);
		Node y;
		Node x;
		if(z.left == null || z.right == null){
			y = z;
		}
		else{
			y = getSuccessor(z.key);
		}
		
		if(z.left != null){
			x = y.left;
		}
		else
			x = y.right;
		
		if(x != null){
			x.parent = y.parent;
		}
		
		if(y.parent == null){
			root = x;
		}
		else{
			if(y == y.parent.left)
				y.parent.left = x;
			else
				y.parent.right = x;
		}
		
		if(y != z)
			z.key = y.key;
	
		return y;
	}
	
	
	public static Node getSuccessor(int id){
		Node x = search(root,id);
		Node y;
		if(x.right != null)
			return TreeMinimum(x.right);
		y = x.parent;
		while(y != null && x == y.right){
			x = y;
			y = y.parent;
		}
		return y;
	}
	
	public static Node TreeMinimum(Node x){
		while(x.left != null)
			x = x.left;
		return x;
	}
	
	public static Node getPredecessor(int id){
		Node x = search(root,id);
		Node y;
		if(x.left != null)
			return TreeMaximum(x.left);
		y = x.parent;
		while(y != null && x == y.left){
			x = y;
			y = y.parent;
		}
		return y;
	}
	
	public static Node TreeMaximum(Node x){
		while(x.right != null)
			x = x.right;
		return x;
	}
	
	
	public void display(Node root){
		if(root!=null){
			display(root.left);
			System.out.print(" " + root.key);
			display(root.right);
		}
	}
	
	
	
	
	
	public static void main(String arg[]){
		BinarySearchTree b = new BinarySearchTree();
		
		
		System.out.println("Anasayfaya Hoşgeldiniz");
		Scanner input = new Scanner(System.in);
		int girilen;
		for(int i = 1 ; i < 11 ; i++){
		System.out.println("Lütfen " + i + ". değeri giriniz :");
		girilen = input.nextInt();	
		b.insert(girilen);
		}
		
		boolean kontrol = true;
		while(kontrol){
		System.out.println("Orjinal Ağaç : ");
		b.display(b.root);		
		System.out.println();
		System.out.println("Arama yapmak için: 1");
		System.out.println("Silme yapmak için: 2");
		System.out.println("Successor bulmak için: 3");
		System.out.println("Predecessor bulmak için: 4");
		System.out.println();
		girilen = input.nextInt();	
		switch(girilen){
		case 1:
			//Arama
			System.out.println("Aramak istediğiniz sayıyı giriniz : ");
			girilen = input.nextInt();
			try{
			System.out.println(b.search(root,girilen).key);
			}
			catch(Exception e){
				System.out.println("Böyle bir sayı bulunmamaktadır.");
				System.out.println();
			}
			break;
		case 2:
			//Silme
			System.out.println("Silmek istediğiniz değeri giriniz : ");
			girilen = input.nextInt();
			b.delete(girilen);
			b.display(b.root);
			System.out.println();
			break;
		case 3:
			//Successor Bulma
			System.out.println("Successorunu bulmak istediğiniz değeri giriniz : ");
			girilen = input.nextInt();
			try{
				System.out.println(getSuccessor(girilen).key);
				}
				catch(Exception e){
					System.out.println("Böyle bir sayı bulunmamaktadır.");
					System.out.println();
				}
			break;
		case 4:
			//Predecessor Bulma
			System.out.println("Predecessorunu bulmak istediğiniz değeri giriniz : ");
			girilen = input.nextInt();
			try{
				System.out.println(getPredecessor(girilen).key);
				}
				catch(Exception e){
					System.out.println("Böyle bir sayı bulunmamaktadır.");
					System.out.println();
				}
			break;
		}
		}
	}
}
