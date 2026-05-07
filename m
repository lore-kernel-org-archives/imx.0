Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3230F346AFB
	for <imx@lists.linux.dev>; Thu,  7 May 2026 07:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137207; cv=none; b=f1GYCm68m5wLPG7k6bfT5qhTliSgNIgSUJiJ5WMZXKgWILkmjz04PUYyvUPvZRm1DMRM8p5FoMghMqr7C28A/s5MkYPvbq+822AP1fIXfW9K01G5PGnOtpaa/a+dl7GBKF6UoSP/iCETk7wnMrRYlpavuVacT28rospVsgD7lxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137207; c=relaxed/simple;
	bh=rVrYFQ1E+kY6VCEFN/jsG7gFIK0ypJMGz3ypmp2ts2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dxyQ4tVrAc9f959R4h2VneyFoY7rEtODtTKXkZuzKsK9n1JvspB0XRQGLJ7agtlVTfxb4JRXKYXKqxZJBUH6bcMfUBykhUFPO18y/MsP+pV7RJFiauKbG9TzLLo/FmjSP/m68qT1KCIzEmeQpVePM1fuSiocDU1Cx3fuHmcRNzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/mipAXi; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/mipAXi"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6948fb494a0so271187eaf.2
        for <imx@lists.linux.dev>; Thu, 07 May 2026 00:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778137205; x=1778742005; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=czRNdIGNEAGaOty2bfNlR72Q18qBDxJFeE6OnxRzYUI=;
        b=g/mipAXiT6ERmJQsvmBL3MpTlZw4XyFtAxaLXqR0cDCdj4iOzCklBL90+cz/CSmRtC
         BPJpMuB7P3E64PqfN2rggTyPYrL3WXHAhnJ8XczBWu4AJk/O0AV1X3IKy1+8ZgCUdu3g
         irkYscb3pQgWzv0l8ACkOqSBmsxkbTatBfxPs8rA9H7HKhRz8IsXlscqulebya5gW3Sm
         Qcks2sHNuhOPxUcuUAeHqJ8G+JmZL2Dvz8aBH2yIMyj94K4lvWSnRoTFLCB/i/HhoNIC
         eaXVMlcM6yG+lRdCdWWDxitVH1WnoFQ0+Q0DctToTIXMVHZ4WU4EzGT7e+SGqz3/a4Cx
         QL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137205; x=1778742005;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czRNdIGNEAGaOty2bfNlR72Q18qBDxJFeE6OnxRzYUI=;
        b=plLCw72f90KCyzrHc7mQgjHPTOXzmyyv3lmtKN9OMRlELugA/oAYu+gGbxO3Cn06PG
         x44QtfLGlSwdz1lfQkKcjntpkp54LmFcL8s8LwWjXeQrvqAVxPtSrrU6P9d5lPl06X1a
         iommvuV0NOGoITmma+UCgx2GnhZdhxfnTB4vVFRB/tp1N74wxu589TOmNy+ot+/UMyme
         cq+H+IequenaSBpZf0tTa6A6dbG3OH1myS55ZpeIUEys4x3ma+4PMkr3dI6zD7JBy9p4
         nZQrYuA2ST8KJTA5XLXcAW3WJge8IEboUQjN70il0SWUtori3ju8swVSbKeMlCKatDMO
         4XEg==
X-Gm-Message-State: AOJu0YwlI/iOsXTcE1sEPb5lgKZQ5OtH13DBYA0ye5cIoMUjShRTJ84A
	/rwmoKygztLcsFDztwtaXLdOzUBr3ex9Z8gJz5sAhn/+Fb+gxVjpFGi8
X-Gm-Gg: AeBDietObzurauOokQTTTU+ThdQDoDHDIVTo9nbKDq13QQZbpc7xvy66ozGaNQHCgny
	u6CzHkg6AjP1eGHbUrhUpWeoRSCswKwLhzKjtyW/3j0J/+kpsQHf3bWJKRpfrMNAvkm6EEDQxLE
	56Iyv3zVJrqmE3bL4BxvqoKiSvljg+5SAzSXEkSVJCTOBvAyZcHR1rliVpj/MO2R4CnkyW7Nm19
	4ihZmvxxu15xI+fGXiiD+dNBK31f9rQ0QjbFunDhWv2LwoqplbzSNOksDbkPlIqUggXe1Z/XATa
	rtg9jkiSGKy1ceJSWa02eak4wTJD5f8gqWhGid4uWwkHNUurL4SlXKFIt3wa0HWLVibw8u+A1Rz
	nBB9PPQF9VdfmT2s+8zrOK/OcilYPRDHIciYhCeNC7wRR56N4d+kKzozi4DySl3dCiUekNoqYbh
	NkU5JjiN31Co1FVi00OD8q0f7GeqvP6A==
X-Received: by 2002:a05:6820:2d0b:b0:694:8c67:5cb6 with SMTP id 006d021491bc7-69998d4d426mr3819602eaf.41.1778137205049;
        Thu, 07 May 2026 00:00:05 -0700 (PDT)
Received: from localhost ([206.212.255.140])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-43454942dc1sm17256879fac.5.2026.05.07.00.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:00:03 -0700 (PDT)
Date: Thu, 7 May 2026 09:59:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev
Subject: [bug report] firmware: drivers: imx: adds miscdev
Message-ID: <afw4bE8pzcHA1Mzd@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Pankaj Gupta,

Commit 4de71839142b ("firmware: drivers: imx: adds miscdev") from Jan
22, 2026 (linux-next), leads to the following Smatch static checker
warning:

	drivers/firmware/imx/se_ctrl.c:681 se_ioctl_setup_iobuf_handler()
	warn: integer overflow "io.length + 7"

drivers/firmware/imx/se_ctrl.c
    644 static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
    645                                         void __user *uarg)
    646 {
    647         struct se_shared_mem *shared_mem = NULL;
    648         struct se_ioctl_setup_iobuf io = {0};
    649         int err = 0;
    650         u32 pos;
    651 
    652         if (copy_from_user(&io, uarg, sizeof(io))) {
    653                 dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
    654                         dev_ctx->devname);
    655                 return -EFAULT;
    656         }
    657 
    658         dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
    659                 io.user_buf, io.length, io.flags);
    660 
    661         if (io.length == 0 || !io.user_buf) {
    662                 /*
    663                  * Accept NULL pointers since some buffers are optional
    664                  * in FW commands. In this case we should return 0 as
    665                  * pointer to be embedded into the message.
    666                  * Skip all data copy part of code below.
    667                  */
    668                 io.ele_addr = 0;
    669                 goto copy;
    670         }
    671 
    672         /* No specific requirement for this buffer. */
    673         shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
    674 
    675         /* Check there is enough space in the shared memory. */
    676         dev_dbg(dev_ctx->priv->dev, "%s: req_size = %d, max_size= %d, curr_pos = %d",
    677                 dev_ctx->devname, round_up(io.length, 8u), shared_mem->size,
    678                 shared_mem->pos);
    679 
    680         if (shared_mem->size < shared_mem->pos ||
--> 681             round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {

If io.length is >= U32_MAX - 7 then round_up() is zero.

    682                 dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
    683                         dev_ctx->devname);
    684                 return -ENOMEM;
    685         }
    686 
    687         /* Allocate space in shared memory. 8 bytes aligned. */
    688         pos = shared_mem->pos;
    689         shared_mem->pos += round_up(io.length, 8u);
    690         io.ele_addr = (u64)shared_mem->dma_addr + pos;
    691 
    692         memset(shared_mem->ptr + pos, 0, io.length);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
And this memset() will crash.

    693         if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
    694             (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
    695                 /*
    696                  * buffer is input:
    697                  * copy data from user space to this allocated buffer.
    698                  */
    699                 if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
    700                         dev_err(dev_ctx->priv->dev,
    701                                 "%s: Failed copy data to shared memory.",
    702                                 dev_ctx->devname);
    703                         return -EFAULT;
    704                 }
    705         }
    706 
    707         err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
    708         if (err < 0)
    709                 dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
    710                         dev_ctx->devname);
    711 
    712 copy:
    713         /* Provide the EdgeLock Enclave address to user space only if success.*/
    714         if (copy_to_user(uarg, &io, sizeof(io))) {
    715                 dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
    716                         dev_ctx->devname);
    717                 err = -EFAULT;
    718         }
    719 
    720         return err;
    721 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
