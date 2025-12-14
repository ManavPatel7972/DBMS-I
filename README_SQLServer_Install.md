# Install & Connect Microsoft SQL Server Express + SSMS (20-Step Guide)

This guide shows **exactly 20 steps** to install **SQL Server Express**, **SQL Server Management Studio (SSMS)**, and connect to your local SQL Server instance on Windows.

---


### SQL Server Installation Process Video Link :
 https://streamable.com/ypp4v6

---

## 🧩 Step-by-step Installation

### 1️⃣ Search for SQL Server download
Open your browser and search for **`download mssql`**.  
Click the official Microsoft result **“SQL Server Downloads”**.

![Step 1 – Google search for download mssql](images/s1.png)

---

### 2️⃣ Open SQL Server Downloads page
You are now on the official **SQL Server Downloads** page on microsoft.com.

![Step 2 – SQL Server downloads page](images/s2.png)

---

### 3️⃣ Choose SQL Server Express
On the **Top downloads** section, find **SQL Server 2025 Express** (or latest Express version) and click **Download now**.

![Step 3 – Select SQL Server 2025 Express Download now](images/s2.png)

---

### 4️⃣ Run SQL Server Express installer
After the download finishes, run the **SQL Server Express** installer.  
In the **SQL Server 2022 Express Edition** window, choose **Basic** installation.

![Step 4 – SQL Server 2022 Express Edition Basic install](images/s5.png)

---

### 5️⃣ Accept license terms
Read the **Microsoft SQL Server License Terms** and click **Accept**.

![Step 5 – Accept SQL Server license terms](images/s6.png)

---

### 6️⃣ Wait for SQL Server to install
The installer will now download and install the SQL Server Express Database Engine with default settings.  
When it finishes, close the installer.

*(No extra configuration is required for this basic setup.)*

![Step 6 – SQL Server Express installation progress/completed](images/s7.png)

---

### 7️⃣ Download SQL Server Management Studio (SSMS)
Open the **SQL Server Management Studio** documentation/download page and click:

**“Download the SQL Server Management Studio SSMS 22 installer”**.

![Step 7 – Download SSMS 22 installer](images/s9.png)

---

### 8️⃣ Allow installer to run (UAC prompt)
Run the downloaded SSMS installer.  
When Windows shows **User Account Control**, click **Yes** to allow **Visual Studio Installer** to make changes.

![Step 8 – User Account Control for Visual Studio Installer](images/s10.png)

---

### 9️⃣ Start Visual Studio Installer
The **Visual Studio Installer** shows a welcome dialog. Click **Continue**.

![Step 9 – Visual Studio Installer Continue](images/s11.png)

---

### 🔟 Select SSMS workloads
On the **Workloads** tab, you will see options such as:

- AI Assistance  
- Business Intelligence  
- Hybrid and Migration  
- Code tools  

Leave the defaults selected (or adjust as you prefer). These include SSMS core components.

![Step 10 – SSMS workloads selection](images/s12.png)

---

### 1️⃣1️⃣ Review installation details & optional tools
On the right side, under **Installation details**, you can see:

- SSMS Core Components  
- AI Assistance  
- Business Intelligence  
- Hybrid and Migration  
- Code tools (with optional Git / Help Viewer)  

Keep the defaults. At the bottom, click **Install**.

![Step 11 – Installation details and Install button](images/s13.png)

---

### 1️⃣2️⃣ Finish SSMS installation
Wait while SSMS is installed.  
When you see **“Done installing – The installation has completed successfully”**, click **OK**.

![Step 12 – SSMS Done installing dialog](images/s14.png)

---

### 1️⃣3️⃣ Launch SQL Server Management Studio
Open the Start menu, search for **“SQL Server Management Studio”**, and launch it.

On first start, a sign-in screen appears. Click **“Skip and add accounts later.”**

![Step 13 – Skip sign-in screen](images/s15.png)

---

### 1️⃣4️⃣ Choose connection dialog experience
SSMS may ask if you want to try the **new connection dialog experience**.  
You can click **Yes** (or **No**; it doesn’t affect the server connection).

![Step 14 – New connection dialog choice](images/s16.png)

---

### 1️⃣5️⃣ Open Connect to Server window
Now you see the **Connect to Server** window.  
The **Server name** box is currently empty. Leave **Authentication** as **Windows Authentication**.

![Step 15 – Empty Server name in Connect to Server](images/s17.png)

---

### 1️⃣6️⃣ Open System Information
To find your computer name, open the Start menu, type **“System Information”**, and open the **System Information** app.

![Step 16 – Open System Information from Start menu](images/s18.png)

---

### 1️⃣7️⃣ Note your System Name
In **System Summary**, find the **System Name** value (for example, `WINDOWS11`).  
This is your machine name.

![Step 17 – System Name in System Information](images/s19.png)

---

### 1️⃣8️⃣ Build the SQL Server instance name
Your local SQL Server Express instance name is:

```text
<SystemName>\SQLEXPRESS
```

Example:

```text
WINDOWS11\SQLEXPRESS
```

This is what you will enter into **Server name** in SSMS.

![Step 18 – Example of instance name WINDOWS11\SQLEXPRESS](images/s20.png)

---

### 1️⃣9️⃣ Connect from SSMS
Return to the **Connect to Server** window in SSMS and fill in:

- **Server name:** `WINDOWS11\SQLEXPRESS` (replace with your actual System Name)  
- **Authentication:** Windows Authentication  
- Optionally tick **Trust Server Certificate**

Then click **Connect**.

![Step 19 – Enter Server name WINDOWS11\SQLEXPRESS and Connect](images/step19.png)

---

### 2️⃣0️⃣ Verify successful connection
If everything is correct, SSMS will connect to your SQL Server Express instance.  
In the **Object Explorer** on the left, you should see your server and system databases like **master**, **model**, **msdb**, and **tempdb**.

You have successfully:

- Installed **SQL Server Express**  
- Installed **SQL Server Management Studio (SSMS)**  
- Connected to your local SQL Server instance ✅

![Step 20 – Connected SQL Server instance in SSMS (Object Explorer)](images/s20.png)

---

## ✅ You’re Ready to Use SQL Server

Now you can:

- Create your own databases  
- Write and run SQL queries  
- Practice for exams or development work

Happy querying! 🎉
