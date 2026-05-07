Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33F2E4257
	for <imx@lists.linux.dev>; Thu,  7 May 2026 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778137631; cv=none; b=ZcmM0RZ2E8Ppp1oEAkuvVKzrD96sIYy7DVAIl3Kdj3DyVY6yt6WCLH73bSECtu+TWLuytJROWMY5PN0gZwJ/SwTNo1Qs+0DrEAyPVLTiCnFIMXo3IWarSUjSDEPcZwiHP/umkfg3iND9ypNQ8f6GCEVBEbWuCAbuRzZCCaErxKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778137631; c=relaxed/simple;
	bh=Mp8qOI0ymgTF7MRFMnrJSwKGm7qofNq7xAvwmlMuEdM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCHj6XZxOyOWeCzTl1PuRqb8Rz4fTAZE05IoCTnkyhrtYtnYdtNrEE4gxMRwl+X0/9tz+E4dJGu69y9BCHwpS1LTUIyugQ20260hyeBg4qLikAp60cfM4fRVwcsLWJGPUYuzAYxn0W9Qq+Bm5mJogAxP355G6NN99fMIrqtT2eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y15YeY7+; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y15YeY7+"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6948d7ccfbbso204467eaf.1
        for <imx@lists.linux.dev>; Thu, 07 May 2026 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778137629; x=1778742429; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vi6oCq53SohMFVYujJQqeHr+etB4I4bT/3jCDWLmU0g=;
        b=Y15YeY7+xY32DdJ91zjhO4d8jQjIA8Ocj8SuWqg6sm83sndhmKtf+yhmUeSFQG6dLC
         OHjBhfPZTlPMkS2+g0v+stesfPa3uh9j5K3EA0CxFjXUhw/CbzwClo/cR/tWFp897q3k
         eBDL25NZai9I8+GT04CN+rPNAXR53eBor+L7XdYtH5THazO+uMgrdaJ0HTxaXlujZ3gC
         wCcJesl5J9KzMyMj6smeQhtW/QolNHz+tGslt3eT21qJe0Es9zHsV7wKCtkEXFbjNThL
         S8r6swuarV6es61gZlz7Lk/+2eNb2sNdAZuiFthTulTKpz7l6qhzaQIcyZR5HdeL1RKm
         G+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778137629; x=1778742429;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vi6oCq53SohMFVYujJQqeHr+etB4I4bT/3jCDWLmU0g=;
        b=Ltof+oPv65hYTKnmLsFUI7mGn8Wy7naD9263dcbedXiVH6JvIPW0ttc1eB9i8es7BI
         KHPaP5Pp+Btit179W/Hsj68PPsU7OkLkaVjBlP5zZCa+jv2YhXz2CMjhPtSOhmrsWIsU
         fhCVB91brb/+rIbN2Icry/0iBb3DcdswP5L75QXDQpgFVzlQZfP6BBhjarzRjE4VHQMB
         DUzOf+wbOLB93z1AsjGzKvR3Y+Qw34pXykzl26hbsh7VOWcZV3EOzPIDOogRmyy6zQB5
         Ds/NsglIJuHsoX6DKxJMi9/+A3YMN5wRMBbnigIInL/Poe6w5+BS7nkCkO8IMQ03Piza
         g5xA==
X-Gm-Message-State: AOJu0YzduBAV5H99lBaFj8crpgsLXKNmSzpJIqVVx0r6CSLcv5pqiDJf
	wiWggmdQCdhw6r6BZg3+rQRkVto+mMnSlopiZO6Pp/Vsvj2+c8B7HrSQ+OSK5ERv
X-Gm-Gg: AeBDietslq6ZUZVFgpRQSUhshHTTggxNmdKxL44b3BFrGqiIE6+fzsVpWyVYLQQQ6ak
	KmVuau2PHorYkUobDoeNoNOICQLjqTVx5Vz+mPgSBrjtEDK/cWUpPCdYaawRVfPkZxaCk6gI+uZ
	ks17sEOSeN2o9os9ljq+Wq89+ggvCl3a4jRuE7y4WI1aM0CBpPFe10HxiOE1zCUN9srdoakqKUD
	B+rvJh/KtrNtv8HsjzB2Bh0lomlzB0Ys7PlXrHMLYNbkN2v0H9N80E0a6ewAj9UvbcfElh9x4VN
	EKXPHqqmoL9Ss1lRoy3JE2/jkNUfgwOiDiRQyD4xLa+n1x9EhF2aRTU5yMxYcU58q9/0w3d/hvb
	8tUnvsaCUB0wD9TZTzJaJsx8xf3Ut8gpiz+XDHrMxOrLyfPscO6QeaG3lHcAzWl7xzZC1D2aj/O
	rJd7Zsogw4LKFigNn76XDyxq6mHFZMCaGcxdzMMt1X
X-Received: by 2002:a05:6820:612:b0:694:914a:ebe1 with SMTP id 006d021491bc7-69998d496f4mr3804389eaf.47.1778137629014;
        Thu, 07 May 2026 00:07:09 -0700 (PDT)
Received: from localhost ([206.212.255.140])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-434548c56fcsm19551255fac.4.2026.05.07.00.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 00:07:07 -0700 (PDT)
Date: Thu, 7 May 2026 10:07:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev
Subject: [bug report] firmware: drivers: imx: adds miscdev
Message-ID: <afw6FIcFDCUEv53L@stanley.mountain>
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

	drivers/firmware/imx/se_ctrl.c:826 se_if_fops_read()
	warn: userbuf overflow? is 'priv->cmd_receiver_clbk_hdl.rx_msg_sz' <= 'size'

drivers/firmware/imx/se_ctrl.c
    789 static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
                                                                          ^^^^^^^^^^^
This function copies memory to the user but it doesn't take into
consideration this size variable which is the size of the buffer
in user space.

    790                                loff_t *ppos)
    791 {
    792         struct se_if_device_ctx *dev_ctx = fp->private_data;
    793         struct se_if_priv *priv = dev_ctx->priv;
    794         int err;
    795 
    796         dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
    797                 buf, size, ((ppos) ? *ppos : 0));
    798 
    799         scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
    800                 if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
    801                         err = -EINVAL;
    802                         goto exit;
    803                 }
    804 
    805                 err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
    806                 if (err < 0) {
    807                         dev_err(priv->dev,
    808                                 "%s: Er[0x%x]: Signal Interrupted. Current act-dev-ctx count: %d.",
    809                                 dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
    810                         goto exit;
    811                 }
    812 
    813                 /* We may need to copy the output data to user before
    814                  * delivering the completion message.
    815                  */
    816                 err = se_dev_ctx_cpy_out_data(dev_ctx);
    817                 if (err < 0)
    818                         goto exit;
    819 
    820                 /* Copy data from the buffer */
    821                 print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
    822                                      priv->cmd_receiver_clbk_hdl.rx_msg,
    823                                      priv->cmd_receiver_clbk_hdl.rx_msg_sz,
    824                                      false);
    825 
--> 826                 if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
    827                                  priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
We should only copy size bytes at most.



    828                         dev_err(priv->dev, "%s: Failed to copy to user.",
    829                                 dev_ctx->devname);

Don't print an error message if copy_to/from_user fails.  Returning
-EFAULT and crashing the program is communication enough.  No need
to fill /var/log/messages with spam.

    830                         err = -EFAULT;
    831                 } else {
    832                         err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
    833                 }
    834 exit:
    835                 priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
    836 
    837                 se_dev_ctx_shared_mem_cleanup(dev_ctx);
    838 
    839                 return err;
    840         }
    841 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
