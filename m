Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FAF4503F5
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085821; cv=none; b=cPrde68ejmDQsdL51gITukZJ9q/PpFIaU380Tih5B/tqu6KodYpNCZWEpN6QwHs7kA/ijBa4HumkjkRy58vic2OfUX+EDjx6Aq+WrTQm8dCy8E4EVJrQu9G6N+Yo6qNkI3JvAYfoW5XcVPRi4XfP2Oll7jw23emxTfYyG+xgCx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085821; c=relaxed/simple;
	bh=tx2vu6tRfNOWOpgF2CyJw75B/ayEkTsq8oTxALj8YAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u91PX7wyMlbd0Rbeiz5ybM/+wWuwqyfJGzka7dBu8yiBVOFJT+0w16oLJ17cRuurUEVLLzHF7ZrNJZPZcy+OVV/Lw1yzxQjndUq4PsRZNXgrNX+l/UVt3qhnX3+lA9QGu4Tkuh64Hak1la+Sh1L2kx9+XkIOtYtqZI1V4E3g6HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5u0og2/; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5u0og2/"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceaf8a1265so44838135ad.2
        for <imx@lists.linux.dev>; Thu, 06 Aug 2026 23:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786085820; x=1786690620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=;
        b=e5u0og2/p1GNAgP4FsBBTxME7J8K44kkWwgL2UMDuezP91pf40h9PCv03I17udp7I1
         lv6FJwumAAfPCRmY9Cc0roPJ4DKIOitY2ktjEeOlfduwwY3xNuDULsu+IYZUOG0rGTh+
         260kAdqBSyAkWr590GIHwLUTTgCDj03oPZZA0ULMYgBixbm8VAuCsuJiV3iMkJOl+Ryl
         QdKtxpoLi2mHBTcTiVCMpVvCUT3WnMMEkBCK4js9RzXd6e+mLxRG681aliaeSe8bkr5w
         uj27X4F4CvdGI8bpOAgG/h7txYd92qfarLyzTAPFNQlGR79Pf3WQIA3EI2aJotnOR4fF
         Iiyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085820; x=1786690620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NEsRntJMT9GLMPPJGd/kwW2aUYHVVekfdk/685HavFM=;
        b=k+aN27AsOOQzuu509dVLApHVK6ZDgX4mUdkuAPDDrWmM3Ez0zapxuyfJJ+eeIpnvT+
         6Xwk9mbGjtdzAJnMded3mGYzruWzRk8HdkEVwsnxKYkoJo4ER2cwQRTbW40HrqJeFPQK
         VSRg0q23x9Mno/mdLQ1RlSuE06tVE5NQi7FFbeFrRZnalD1oPzm8WYagElcNzisJgAvc
         QS69zDH/ylrs63BOAQ09T3OTbEygKr+lzEh2ylX9YH4tGZxr5n3xKDbR6JSV9JEUM4xh
         T3mKQ6diEBhRMouS5KkqjipFWMdwQU02IonxfdcJcmiz+WOpc1q19vj3EO5fO1Qy9YJC
         XvqQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCP6g8u592/fxMIW1bRwwV7QNYUAcwB5LlguNZ5dhhjMN3CxPyJCrqvtN7EWP1rMVHSqA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxA/DtpoU/AZehNNwSKqJ/tP7UGyr/SxO0DtGU5BDA6UAwXg1m/
	yy/hxuCsx5YDw0z6Zm3K8hIiFpP9+wjSejYd3oPmpgNzpkwjdsfFZ/85
X-Gm-Gg: AR+sD130P44vL9D+aoQK28JvzXjCTf361xD+SgjSspOkGoYWmkBFAunNA1sDPDj7mX9
	93UN/5PcDpp7SXkcl35ZVcCr4t9tURL6aVLXYX5iZvlVcT8BrU0ztSOgWBxrj/saT7PjBJlpCPp
	45YStSmH4vjw2dOhjj//Zfq/0NiXovlqDGiJvZRy50pbY6rVjyoRvBJififlUv6VRnUbfxC/W4j
	ffUmnnTUQaCHyrRlrURN8kH3uOu7MCvqSisduY3uNC7seRagICV4nShIYa/5gcpZGKSdurYi+BC
	hDDnk/tzGRYHFpFf6V1/Td+IgfbzlJlt4Sq4sxO/MnGzZwsvOVFDaIE+n6ESZZ9Qrun6kg07Mg8
	/iROTA9SLwJzUQR9FB4FAYnYNHiOGxaUW4GHnEyHW7zf9iuFt5pHIQNU0PZaP5vbqHUYv0NNFja
	F2zVqBjdz1msSZWc6iPzKGwwV1VC4HHTp+vAm19FC0DdgU67rDbbC8+UuJXyEn+bJ/Vcnl6/qNJ
	yH4xl8XR0HgfsuCJV5OU3UtRfoTXgvK9LoUegcec29uyEUEPQmL+VTdRnO/Y78sSfitqSTTBZSQ
	kLj7GdIX/Y3yHos=
X-Received: by 2002:a17:902:e84b:b0:2c9:b396:1a55 with SMTP id d9443c01a7336-2d0ca76a3bamr221579765ad.12.1786085819613;
        Thu, 06 Aug 2026 23:56:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14ccb0b2dsm4420185ad.3.2026.08.06.23.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:56:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>,
	Sashiko Bot <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] usb: chipidea: ci_hdrc_imx: Fix error handling when creating IRQ name
Date: Fri,  7 Aug 2026 13:56:19 +0700
Message-ID: <20260807065619.30604-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807065619.30604-1-phucduc.bui@gmail.com>
References: <20260807065619.30604-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

devm_kasprintf() can fail when allocating the wakeup IRQ name. The error
was logged with dev_err_probe(), but its return value was ignored and
probe could continue with a successful return value.

Store the error returned by dev_err_probe() in ret and jump to the error
path to propagate the failure.

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/all/20260806065755.C9F361F000E9@smtp.kernel.org/
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

 drivers/usb/chipidea/ci_hdrc_imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 7387c9903e80..ec2280ae82dc 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -532,7 +532,7 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-			dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
+			ret = dev_err_probe(dev, -ENOMEM, "failed to create irq_name\n");
 			goto err_clk;
 		}
 
-- 
2.43.0

