namespace TestConnection
{
    partial class TestConnection
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbl_Cnn = new System.Windows.Forms.Label();
            this.txt_Cnn = new System.Windows.Forms.TextBox();
            this.btn_Cnn = new System.Windows.Forms.Button();
            this.cbo_Sps = new System.Windows.Forms.ComboBox();
            this.lbl_Sps = new System.Windows.Forms.Label();
            this.rtx_Parametros = new System.Windows.Forms.RichTextBox();
            this.lbl_Parametros = new System.Windows.Forms.Label();
            this.dg_Resultados = new System.Windows.Forms.DataGridView();
            this.btn_Query = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dg_Resultados)).BeginInit();
            this.SuspendLayout();
            // 
            // lbl_Cnn
            // 
            this.lbl_Cnn.AutoSize = true;
            this.lbl_Cnn.Location = new System.Drawing.Point(12, 27);
            this.lbl_Cnn.Name = "lbl_Cnn";
            this.lbl_Cnn.Size = new System.Drawing.Size(91, 13);
            this.lbl_Cnn.TabIndex = 0;
            this.lbl_Cnn.Text = "Connection String";
            // 
            // txt_Cnn
            // 
            this.txt_Cnn.Location = new System.Drawing.Point(109, 24);
            this.txt_Cnn.Name = "txt_Cnn";
            this.txt_Cnn.Size = new System.Drawing.Size(477, 20);
            this.txt_Cnn.TabIndex = 1;
            // 
            // btn_Cnn
            // 
            this.btn_Cnn.Location = new System.Drawing.Point(592, 17);
            this.btn_Cnn.Name = "btn_Cnn";
            this.btn_Cnn.Size = new System.Drawing.Size(75, 33);
            this.btn_Cnn.TabIndex = 2;
            this.btn_Cnn.Text = "Conectar";
            this.btn_Cnn.UseVisualStyleBackColor = true;
            this.btn_Cnn.Click += new System.EventHandler(this.btn_Cnn_Click);
            // 
            // cbo_Sps
            // 
            this.cbo_Sps.AutoCompleteMode = System.Windows.Forms.AutoCompleteMode.SuggestAppend;
            this.cbo_Sps.AutoCompleteSource = System.Windows.Forms.AutoCompleteSource.ListItems;
            this.cbo_Sps.FormattingEnabled = true;
            this.cbo_Sps.Location = new System.Drawing.Point(15, 82);
            this.cbo_Sps.Name = "cbo_Sps";
            this.cbo_Sps.Size = new System.Drawing.Size(234, 21);
            this.cbo_Sps.TabIndex = 3;
            // 
            // lbl_Sps
            // 
            this.lbl_Sps.AutoSize = true;
            this.lbl_Sps.Location = new System.Drawing.Point(12, 66);
            this.lbl_Sps.Name = "lbl_Sps";
            this.lbl_Sps.Size = new System.Drawing.Size(88, 13);
            this.lbl_Sps.TabIndex = 4;
            this.lbl_Sps.Text = "Selecciona el SP";
            // 
            // rtx_Parametros
            // 
            this.rtx_Parametros.Location = new System.Drawing.Point(327, 82);
            this.rtx_Parametros.Name = "rtx_Parametros";
            this.rtx_Parametros.Size = new System.Drawing.Size(340, 96);
            this.rtx_Parametros.TabIndex = 5;
            this.rtx_Parametros.Text = "";
            // 
            // lbl_Parametros
            // 
            this.lbl_Parametros.AutoSize = true;
            this.lbl_Parametros.Location = new System.Drawing.Point(324, 66);
            this.lbl_Parametros.Name = "lbl_Parametros";
            this.lbl_Parametros.Size = new System.Drawing.Size(60, 13);
            this.lbl_Parametros.TabIndex = 6;
            this.lbl_Parametros.Text = "Parametros";
            // 
            // dg_Resultados
            // 
            this.dg_Resultados.AllowUserToAddRows = false;
            this.dg_Resultados.AllowUserToDeleteRows = false;
            this.dg_Resultados.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dg_Resultados.Location = new System.Drawing.Point(15, 203);
            this.dg_Resultados.Name = "dg_Resultados";
            this.dg_Resultados.Size = new System.Drawing.Size(652, 268);
            this.dg_Resultados.TabIndex = 7;
            // 
            // btn_Query
            // 
            this.btn_Query.Location = new System.Drawing.Point(15, 145);
            this.btn_Query.Name = "btn_Query";
            this.btn_Query.Size = new System.Drawing.Size(75, 33);
            this.btn_Query.TabIndex = 8;
            this.btn_Query.Text = "Ejecutar SP";
            this.btn_Query.UseVisualStyleBackColor = true;
            this.btn_Query.Click += new System.EventHandler(this.btn_Query_Click);
            // 
            // TestConnection
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(698, 483);
            this.Controls.Add(this.btn_Query);
            this.Controls.Add(this.dg_Resultados);
            this.Controls.Add(this.lbl_Parametros);
            this.Controls.Add(this.rtx_Parametros);
            this.Controls.Add(this.lbl_Sps);
            this.Controls.Add(this.cbo_Sps);
            this.Controls.Add(this.btn_Cnn);
            this.Controls.Add(this.txt_Cnn);
            this.Controls.Add(this.lbl_Cnn);
            this.Name = "TestConnection";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Test Connection";
            this.Load += new System.EventHandler(this.TestConnection_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dg_Resultados)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbl_Cnn;
        private System.Windows.Forms.TextBox txt_Cnn;
        private System.Windows.Forms.Button btn_Cnn;
        private System.Windows.Forms.ComboBox cbo_Sps;
        private System.Windows.Forms.Label lbl_Sps;
        private System.Windows.Forms.RichTextBox rtx_Parametros;
        private System.Windows.Forms.Label lbl_Parametros;
        private System.Windows.Forms.DataGridView dg_Resultados;
        private System.Windows.Forms.Button btn_Query;
    }
}

