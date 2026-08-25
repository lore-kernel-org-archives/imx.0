Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0073DB64E;
	Tue, 25 Aug 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787645298; cv=none; b=qV/6IPHnuwo/ZRtc8YwxBqoLBYHUJmgV7/xcgjUwk/dlUmnkH9NSSH24IVsmVih9+fi3yKCs0xGEmB7vmivqCtTblPcMh0TSTA88QGKxGj2v7OJEdKnIyPeNjmpqCR3+/nRZqF4mcEfDH3ycPvTkrghknKjsHKm4O3Nz0u1gph0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787645298; c=relaxed/simple;
	bh=OELXcTUyFmBaEVWUR9H4C17xjAfQSWoR0TSvppEZF80=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=Ssu82REn75LY9KQjQMjRhfyip91+xa4/FNMSMnoHsQE4VGY7iHtX/07QbG5P0gd2VxfJcniQgA7YdQUuapRMXdUhcnPk3A79IPk9nbUc+V48eBOmkrj7r5L7rsuFYtfO5HGCWbTa5tJPyd9V/JX5uj1As3dtUP7ZjNu/FV7SlYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=2M4jgQjW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="2M4jgQjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14FD1F00A3E;
	Tue, 25 Aug 2026 08:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787645294;
	bh=CzPTi7tIXhfTEP2ST8/9iB8oDWj+fQxEYt0icXPUvmg=;
	h=Subject:To:Cc:From:Date;
	b=2M4jgQjWcSk3Pcs8PfqnEpq0BHFbO2OkVaslxh/9USE2RWA/EQWthpCyDaCbofhVm
	 U3DzlEmyw4wCngIQT0QYbcy6ZGjk8bPPjFE3qdJUVu6+5LBMOf1hgyMTVD64iIbDE+
	 8gruiOpZN8Jfg82wNgNWNG3vCI03KuH7MtBZXcDY=
Subject: Patch "dmaengine: fsl-edma: Add error handling for devm_kasprintf" has been added to the 7.1-stable tree
To: Frank.Li@nxp.com,gregkh@linuxfoundation.org,griffin@kroah.com,imx@lists.linux.dev,stable@kernel.org,vkoul@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 25 Aug 2026 10:06:58 +0200
Message-ID: <2026082558-feminism-wool-e88e@gregkh>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    dmaengine: fsl-edma: Add error handling for devm_kasprintf

to the 7.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dmaengine-fsl-edma-add-error-handling-for-devm_kasprintf.patch
and it can be found in the queue-7.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bf1af4dfdc017dfe989c0dbcf0e608dc95f1d2cb Mon Sep 17 00:00:00 2001
From: Griffin Kroah-Hartman <griffin@kroah.com>
Date: Mon, 6 Jul 2026 16:57:06 +0200
Subject: dmaengine: fsl-edma: Add error handling for devm_kasprintf

From: Griffin Kroah-Hartman <griffin@kroah.com>

commit bf1af4dfdc017dfe989c0dbcf0e608dc95f1d2cb upstream.

Add error handling statement to fls_edma3_irq_init() for the
devm_kasprintf call.

Assisted-by: gkh_clanker_2000
Cc: stable <stable@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: imx@lists.linux.dev
Signed-off-by: Griffin Kroah-Hartman <griffin@kroah.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Link: https://patch.msgid.link/2026070605-frying-fling-b9c5@gregkh
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma/fsl-edma-main.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -414,6 +414,8 @@ static int fsl_edma3_irq_init(struct pla
 
 		errirq_name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-err",
 					     dev_name(&pdev->dev));
+		if (!errirq_name)
+			return -ENOMEM;
 
 		ret = devm_request_irq(&pdev->dev, fsl_edma->errirq, fsl_edma3_err_handler_shared,
 				       0, errirq_name, fsl_edma);


Patches currently in stable-queue which might be from griffin@kroah.com are

queue-7.1/mailbox-mchp-ipc-sbi-add-null-check-for-devm_kasprintf.patch
queue-7.1/rndis_host-add-overflow-check-in-rndis_rx_fixup.patch
queue-7.1/dmaengine-fsl-edma-add-error-handling-for-devm_kasprintf.patch
