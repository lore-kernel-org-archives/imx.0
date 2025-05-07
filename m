Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C14223DE2
	for <imx@lists.linux.dev>; Wed,  7 May 2025 07:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746602037; cv=none; b=SBHjBXMudv5KorlOTUmI8bUQF65b7xRO1pFKdH8+9Fd9DuVz5JteGk26Hg4LnDfZJkj2KRNsziHDtIPu/g3tJFZE64C15PjqnL1MtlAWWcJIqNo0E85/oImAukGIkHxQZcDmJ7BUvGufxiDxeFIfC59ximMBD0fKyo5BxHXzVk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746602037; c=relaxed/simple;
	bh=YfuRLPgqOBQZBBQlRs96BjwEv2D+fa2L0aVxYK/CvXo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHCcAPXz7VbB4Cp93DMmJ8Pn6Tv1DMuwiTWjWGudTU+2e09zbb8pOmJIBeeOISZ+hLfflGyd8SSScdwI9OSN1QaJnCOzR9IbcA3I/QUu5DvilzecNG1s698lFpWU+417VoX+WSIMG9bRgza1gpgBYgGAzlnVfBlTYMaG5eNDL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mQbHoHuO; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mQbHoHuO"
Received: by mail.gandi.net (Postfix) with ESMTPA id 218FF43B62;
	Wed,  7 May 2025 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746602034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/Vpofllz9uvTkBvwyXS9bs6uGOP3mNTrdme1mQDCAM=;
	b=mQbHoHuOW+/XCEIJ0w4Zk0Xq3ojyGApVZHJ/sWPkSNiMM4vwG0CFsfS+bbHW2pCL38YW7B
	phC3EfSfjURysIukeiPHHRJSHwbdk/Xjei9nSyTEbgLjQc9ElVPzYgcFm6x9oC9qd8tLUh
	NpLSaZRY1YBiO5ll4IS5RlBL8NCIXv6yaoocCGTj+PsWOU5q0BfAaq670NghNOLiIn2SHQ
	d8HYAn/iC3DnpdTOLDE4GtWdJJuRvEowWwbncOdXR4g6koiB4E7QGeTgLt05ELPU1vGoB/
	WwrsdlaaQW+sXDxmF9YmS5qcpg/q/FnnTFPL/8ndUh2VMqFcf4TJj/LqjCncLQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mark Brown <broonie@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 14/26] i2c: core: Introduce i2c_get_adapter_physdev()
Date: Wed,  7 May 2025 09:12:56 +0200
Message-ID: <20250507071315.394857-15-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507071315.394857-1-herve.codina@bootlin.com>
References: <20250507071315.394857-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefjvghrvhgvucevohguihhnrgcuoehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheffiefgjeeuleeuueffleeufefglefhjefhheeigedukeetieeltddthfffkeffnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgepleenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegvddprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshdrh
 hgruhgvrhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtohepkhgvrhhnvghlsehpvghnghhuthhrohhnihigrdguvgdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com

The physical device providing an I2C adapter is the device that calls
i2c_add_adapter() or variants and i2c_del_adapter().

Most of the time this physical device is the parent of the adapter
device.

Exceptions exist with i2c muxes. Indeed, in case of i2c muxes, the
parent of the mux adapter device points to the adapter device the mux is
connected to instead of the physical of this mux adapter.

Introduce i2c_get_adapter_physdev() and a new physdev field in the
adapter structure in order to ease the adapter physical device
retrieval.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/i2c/i2c-core-base.c | 16 ++++++++++++++++
 include/linux/i2c.h         |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 7ad1ad5c8c3f..f36a00b7ff8f 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1917,6 +1917,22 @@ struct i2c_adapter *i2c_get_adapter_by_fwnode(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL(i2c_get_adapter_by_fwnode);
 
+/**
+ * i2c_get_adapter_physdev() - Get the physical device of an adapter
+ * @adapter: the adapter to get the physical device from
+ *
+ * Return:
+ * Look up and return the &struct device corresponding to the device supplying
+ * this @adapter.
+ *
+ * The user must call put_device() once done with the physical device returned.
+ */
+struct device *i2c_get_adapter_physdev(struct i2c_adapter *adapter)
+{
+	return get_device(adapter->physdev ?: adapter->dev.parent);
+}
+EXPORT_SYMBOL(i2c_get_adapter_physdev);
+
 static void i2c_parse_timing(struct device *dev, char *prop_name, u32 *cur_val_p,
 			    u32 def_val, bool use_def)
 {
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc..c3648c9e1891 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -746,6 +746,7 @@ struct i2c_adapter {
 	int timeout;			/* in jiffies */
 	int retries;
 	struct device dev;		/* the adapter device */
+	struct device *physdev;		/* the physical device */
 	unsigned long locked_flags;	/* owned by the I2C core */
 #define I2C_ALF_IS_SUSPENDED		0
 #define I2C_ALF_SUSPEND_REPORTED	1
@@ -913,6 +914,8 @@ struct i2c_adapter *i2c_get_adapter(int nr);
 void i2c_put_adapter(struct i2c_adapter *adap);
 unsigned int i2c_adapter_depth(struct i2c_adapter *adapter);
 
+struct device *i2c_get_adapter_physdev(struct i2c_adapter *adap);
+
 void i2c_parse_fw_timings(struct device *dev, struct i2c_timings *t, bool use_defaults);
 
 /* Return the functionality mask */
-- 
2.49.0

