Received: from fhigh-b1-smtp.messagingengine.com (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C19430FC1C
	for <imx@lists.linux.dev>; Wed,  6 May 2026 21:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778102359; cv=none; b=tlmdRQMlgRwPhtxK6YFfR9sPpDsqkmzT15O4c510cBGHbAi8wsG3U+dpUo9ALetcNttevo6xOfO0U23wkQ10IUKACK0P3Fqusbse0Oopl2G5HEHvN8m0Fpu4DtRmAFnaKt7KRPVojV51lyISJJw3auRvOZTbFURUGRXw26/voII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778102359; c=relaxed/simple;
	bh=ctaT8gkBufYtonPZ6h8ddsaEIQxZcrlp/E9jCVY/M9Q=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AC3TK09puX3kYghOYGYKvw4jyd56A7LmwwxCaJZA/O0gmDhCby0xTbXpNzYA5NdzUpqLfVSPmylUhTeJ+WhYIo070z6pmgRLy6uFnv0p9MUw1fRwHATayhsVrCY1dab8Qv+7ABXY1RFniC1RGv0uqMYdD7dFwVNO0ztiHjObRkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=JEbmndAj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=qeRXDfmy; arc=none smtp.client-ip=202.12.124.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="JEbmndAj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="qeRXDfmy"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CD4947A00F6;
	Wed,  6 May 2026 17:19:15 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Wed, 06 May 2026 17:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778102355;
	 x=1778188755; bh=Hb5NSsJ4ULwA97adOBWN9zAaTIU5jvI3asjKRSTog1A=; b=
	JEbmndAjQDi8Yn2fOO9/CsW6rYV1/bx1rmAd8+mdWtkvBf2dEiU5pTdGvQYfRYMa
	cFVZU1CKqjqsSsFu5Pwjn/Ba7UzkoMKA1ZKWNMkzQVcznD9lCWkP3CBKKttN/HE5
	YA62Tp6s5wakZm8xhl8XOfIZWCfXxNuGSWY9xuFUox4WlUZDHx4Ra6Zm2Yq7WjJ1
	9LJE5cIHYC4kLoNR4SWqcGY2x98UjH4Us/FUoJNFRdJJyG94TgdII+925QAiPTM8
	F9X/Pe8HO9l4NUnSk4cBvIahkI5TeDGEAB6ASja5U4aEg/8CjFUuTu/TpkhBk/mU
	Y0sxQEb7hVRHPzFie/iTSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778102355; x=
	1778188755; bh=Hb5NSsJ4ULwA97adOBWN9zAaTIU5jvI3asjKRSTog1A=; b=q
	eRXDfmyXGObX/anaCWFqA2tEeX5iOE9V6PQ4xtbM/++nJarj9ISgsce1OQ8hUJ+F
	jcAHI/dC8lIzuzPIOPQZQ7gYZNrj+1kqOZYkR3Vz4ZUijcq7FBTZneQlka/uXLLU
	lDQyE7W4vGFxwDV5OAnbwDLWPAZfWHcwXoXI3rwaItTA1uOjcjJNyREgpDlJ6COR
	syqogE2uSwsQuAVVlqsnnJdQ5NY6R/m1LCYxmtDen9W04hZGhIbeB6z8dp/aW/Gu
	VL4ynj7Fi9ai6adXe/mEnR8kXUC1HnlBy+gvDUw/gwGNW2Kz2ysdNNwjc6iyZ+xY
	igwwA16cx//whbqfleUTA==
X-ME-Sender: <xms:U7D7aSqEUd_Ck2evKcV25PncTMmEmWN3zDJ7TzjdQ6ixt77aFzzTVw>
    <xme:U7D7abfVuXAnRkp1GPcFib68P45nNC9pG4Btvj1teCqbMhDzoiFGExFVzW-YFzlZv
    cfKuTXaYU6WkgW9s7aJsiXfnSxksdNBmfWEK-WSI8BBHDT1Ipuz-iBK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdehieehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehfvghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhope
    gtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodguthes
    khgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehshhgrfihnghhuoheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpd
    hrtghpthhtohepihhmgieslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopegt
    ohhrsggvtheslhifnhdrnhgvthdprhgtphhtthhopehfrhgrnhhkrdhlihesnhigphdrtg
    homh
X-ME-Proxy: <xmx:U7D7aXsm0ylPKubcAJpxjL1muw_8yfBDuhWtxxjdyRxAJ8hkJVsaaA>
    <xmx:U7D7aeBDkVrd2_zt9nYyNeJAOLNGfkqajdUTAB3cJ0N3s26AokjhTw>
    <xmx:U7D7aUWupvkLekRPxcZP0jRo-zR0uD1zNR5WjG81Wg4dkm5SgNMC4w>
    <xmx:U7D7aXFvrGmlJEEm1UXLPidGA3aBPHIOmQoWMKH2vJX2CshfmqpeCA>
    <xmx:U7D7aTXRb0GhvayW5WUSDQoT8cHxN6StKRM3mJKSQv7tqBxDDabWY6-R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1BF1D1060065; Wed,  6 May 2026 17:19:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: AykGkFpMyVjZ
Date: Wed, 06 May 2026 23:18:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, "Frank Li" <Frank.Li@nxp.com>
Message-Id: <0394bcb5-d6fb-4756-afed-5b01c914220c@app.fastmail.com>
In-Reply-To: <20260122-imx-se-if-v25-5-5c3e3e3b69a8@nxp.com>
References: <20260122-imx-se-if-v25-0-5c3e3e3b69a8@nxp.com>
 <20260122-imx-se-if-v25-5-5c3e3e3b69a8@nxp.com>
Subject: Re: [PATCH v25 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Thu, Jan 22, 2026, at 12:49, Pankaj Gupta wrote:

> +/* IOCTL definitions. */
> +
> +struct se_ioctl_setup_iobuf {
> +	void __user *user_buf;
> +	__u32 length;
> +	__u32 flags;
> +	__u64 ele_addr;
> +};
> +
> +struct se_ioctl_cmd_snd_rcv_rsp_info {
> +	__u32 __user *tx_buf;
> +	int tx_buf_sz;
> +	__u32 __user *rx_buf;
> +	int rx_buf_sz;


These just showed up in linux-next and triggered warnings
in my (still private) uapi checks:

./usr/include/linux/se_ioctl.h:22:15: error: padding struct to align 'ele_addr' [-Werror=padded]
   22 |         __u64 ele_addr;
      |               ^~~~~~~~

./usr/include/linux/se_ioctl.h:45:16: error: padding struct to align 'rx_buf' [-Werror=padded]
   45 |         __u32 *rx_buf;
      |                ^~~~~~
./usr/include/linux/se_ioctl.h:47:1: error: padding struct size to alignment boundary with 4 bytes [-Werror=padded]
   47 | };


The problem here is the use of indirect pointers, which are nor
recommended in ABI structures because of the implied padding and
the need for compat mode handlers, see
Documentation/driver-api/ioctl.rst.

I think the fixup below should address all of this, but I
have not reviewed the driver in detail to see if thats's all.

I also noticed that the __user annotations are inconsistent,
so please also run this through 'make C=1' and fix up the
warnings you get.

    Arnd

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 2ba0a6988a39..d0e3d981d1e0 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -384,7 +384,7 @@ static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
 		return -ENOMEM;
 
 	b_desc->shared_buf_ptr = shared_ptr_with_pos;
-	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->usr_buf_ptr = u64_to_user_ptr(io->user_buf);
 	b_desc->size = io->length;
 
 	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
@@ -526,13 +526,13 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 	}
 
 	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
-		dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
+		dev_err(priv->dev, "%s: User buffer too small(%lld < %d)",
 			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
 		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
 		return -ENOSPC;
 	}
 
-	err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
+	err = se_chk_tx_msg_hdr(priv, u64_to_user_ptr(cmd_snd_rcv_rsp_info.tx_buf));
 	if (err) {
 		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
 		return err;
@@ -546,7 +546,7 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 	}
 
 	struct se_api_msg *tx_msg __free(kfree) =
-		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+		memdup_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.tx_buf),
 			    cmd_snd_rcv_rsp_info.tx_buf_sz);
 	if (IS_ERR(tx_msg)) {
 		err = PTR_ERR(tx_msg);
@@ -593,8 +593,8 @@ static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
 	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
 			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
 
-	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
-			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+	if (copy_to_user(u64_to_user_ptr(cmd_snd_rcv_rsp_info.rx_buf),
+			 rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz)) {
 		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
 		err = -EFAULT;
 	}
@@ -655,7 +655,7 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 		return -EFAULT;
 	}
 
-	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %llx(%d) flag: %x].", dev_ctx->devname,
 		io.user_buf, io.length, io.flags);
 
 	if (io.length == 0 || !io.user_buf) {
@@ -696,7 +696,8 @@ static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
 		 * buffer is input:
 		 * copy data from user space to this allocated buffer.
 		 */
-		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
+		if (copy_from_user(shared_mem->ptr + pos,
+				   u64_to_user_ptr(io.user_buf), io.length)) {
 			dev_err(dev_ctx->priv->dev,
 				"%s: Failed copy data to shared memory.",
 				dev_ctx->devname);
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
index 0c948bdc8c26..9fb81cb72b94 100644
--- a/include/uapi/linux/se_ioctl.h
+++ b/include/uapi/linux/se_ioctl.h
@@ -16,7 +16,7 @@
 /* IOCTL definitions. */
 
 struct se_ioctl_setup_iobuf {
-	void __user *user_buf;
+	__u64 user_buf;
 	__u32 length;
 	__u32 flags;
 	__u64 ele_addr;
@@ -40,10 +40,10 @@ struct se_ioctl_get_if_info {
 };
 
 struct se_ioctl_cmd_snd_rcv_rsp_info {
-	__u32 __user *tx_buf;
-	int tx_buf_sz;
-	__u32 __user *rx_buf;
-	int rx_buf_sz;
+	__u64 tx_buf;
+	__u64 tx_buf_sz;
+	__u64 rx_buf;
+	__u64 rx_buf_sz;
 };
 
 struct se_ioctl_get_soc_info {
