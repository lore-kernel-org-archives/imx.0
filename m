Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609B51DE4DF
	for <imx@lists.linux.dev>; Thu, 16 Jan 2025 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737032974; cv=none; b=LffISiOaDZF2M8MbEYIKqh0pA0RlIFhF0lcANgfbanIZJglPRPFCoJtAXKfmYzBu0l+45jBoPZxquPEEMvBoRvY4eJqcydO81CGg76eGWFDe7MPfFPW8KmX+0BpFbj93xMK88ZH12shSISUULYl7rbFV7MQRLrLMByL7ymtQeYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737032974; c=relaxed/simple;
	bh=cIAqiPzlev6Stxgd/seSBG5lcv2RnLx9IgIT7Mx0JD0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gd6SxeatEWAmw7j6kBhqTPN4zyTU+7tWW7g75ZZz2jE/7UNiX8IdTobr9EUvT706XqgpjNf+RDGs4zr8a4SX3euBroNFUmC19Fho7SciZd54NNXvK621S3VaWygYPqJZ6M5EVSjAkAUsUA8Jp+BE2AW+LFRU/MEWuLMjEC3UjJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpxygfAN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpxygfAN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21636268e43so19555125ad.2
        for <imx@lists.linux.dev>; Thu, 16 Jan 2025 05:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737032973; x=1737637773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=snptrSjCp/WTiLu8I8u0XSZwNccoh5U/0syc3p+zW30=;
        b=HpxygfANOlr+qisT8aUNS8vLQjK6XUfCSlacXoTSGOp05i91/GZ11GkVrI7f5dCx58
         s/a5p3uuhskILANvdtWUTSDBHWDTQwUW5G9XNB+A8R+tEZZelvhpkJB3Ry7YimumMwhD
         Ffb/v2HKXLg+59KNgYdkKS9+Nef6cL5H7wKMPX2wXWaF8xPAAFm3oShhgyAzm49Q20Kz
         vV5LCLXplTn8Yl307Ck24neRGw0gYJjudew4t83uxlKMwGuOTv+4WFsqWWQl5viNfA2/
         aaGs4QFP7571byuw+gj86bFd1/ziGIqISoSiY9cXnJgZELt5ngEb4Q/u4blIUNFMVLA5
         Qltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737032973; x=1737637773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snptrSjCp/WTiLu8I8u0XSZwNccoh5U/0syc3p+zW30=;
        b=HzYisPlAPVJwtZhTPA3Es2t8KLByJi9sJZPV25Gr6k03QSMlUAPO09wM8w/CTde+Nb
         3AAbSrWL+65EzSAy1imjcuiWguzlmyxzPS+tlG3MpEYh+2auBsLGkpWLf+6VX61hygWn
         VZPTAxmphFMdX67Wn/byjdxarF1VHeCOZuXD+RDfJFPdcG/KwD94s0oQz9H429K7/1bo
         J8lSrXpW1ok5WIiMCB5iR07WDu+vyRfRXcVjJ7/OqneX8VkvI89DNP230bUccrXSjYJ0
         zgG0cIx7W/SAKWfgsP1r1edMlIo30XJVuF8hzYb0v95Fyn/5fLBo7xxf6NrnMGVsa9/W
         gz2g==
X-Forwarded-Encrypted: i=1; AJvYcCX+IqU8kfDkqlyNSdJu+hGCCHjHbM9gKOopsT92sNDGZmwmZYYoKWF94FK9fWBb+TiSTo0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxEzdP2aE9keEkEiEcpxtkLjD6fFaKQOC9T8+M1AGgx1GkHqJyS
	4N3/KZU8qvPR2ibC7D/e279h76eFp+irNU7nd6UV2gEokFDDQGlr
X-Gm-Gg: ASbGncvRGxiwUr9DWAEJ2FJRr+Yo2XUSV5oF4uc+EgfsnSMaj1zoNLQIFBSBuhEpCkx
	L9t+IR0yys6rFfKKgrqcA0Gc3fXn8r05wP7yf0SsuFiqVWOJXrG5WCDGO0GD9Z8yQZz523tT8IJ
	CcM98hiFw3Wlzwj96wZ60abpnpYoTlw6b9dhZwoPLai2K/ejkw4JCkdJVkEj4wnA1jjfRibyXld
	gDqBAm2KHslaJnPVp/MYzSYd6wuBwZuLfg6+hzh7Mpyg8RbyuLfeprtLoTx
X-Google-Smtp-Source: AGHT+IFwvxoH6j5w/7H364LI1PDnz4GWvdvRTrSBQCw/AugbZy6zJhUICULr6Udxk4KcvLdJYHGJmw==
X-Received: by 2002:a17:902:ea0a:b0:216:6769:9ee7 with SMTP id d9443c01a7336-21a83ffbab5mr535838205ad.41.1737032972572;
        Thu, 16 Jan 2025 05:09:32 -0800 (PST)
Received: from HOME-PC ([223.185.135.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f22d0d7sm98728015ad.163.2025.01.16.05.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 05:09:32 -0800 (PST)
From: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
To: wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
Subject: [PATCH net-next] net: fec: implement TSO descriptor cleanup
Date: Thu, 16 Jan 2025 18:39:20 +0530
Message-Id: <20250116130920.30984-1-dheeraj.linuxdev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Implement the TODO in fec_enet_txq_submit_tso() error path to properly
release buffer descriptors that were allocated during a failed TSO
operation. This prevents descriptor leaks when TSO operations fail
partway through.

The cleanup iterates from the starting descriptor to where the error
occurred, resetting the status and buffer address fields of each
descriptor.

Signed-off-by: Dheeraj Reddy Jonnalagadda <dheeraj.linuxdev@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index b2daed55bf6c..eff065010c9e 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -913,7 +913,18 @@ static int fec_enet_txq_submit_tso(struct fec_enet_priv_tx_q *txq,
 	return 0;
 
 err_release:
-	/* TODO: Release all used data descriptors for TSO */
+	/* Release all used data descriptors for TSO */
+	struct bufdesc *tmp_bdp = txq->bd.cur;
+
+	while (tmp_bdp != bdp) {
+		tmp_bdp->cbd_sc = 0;
+		tmp_bdp->cbd_bufaddr = 0;
+		tmp_bdp->cbd_datlen = 0;
+		tmp_bdp = fec_enet_get_nextdesc(tmp_bdp, &txq->bd);
+	}
+
+	dev_kfree_skb_any(skb);
+
 	return ret;
 }
 
-- 
2.34.1

