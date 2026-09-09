Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FEE3B05A5
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 06:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788936462; cv=none; b=i3IUX2k4yisMqu7wtDAVv5ub1Cip+WLpFdKwb+rnlJIm21HhsmqW4zPWXeCYvRmT1jrAY0NWXV/UasMQDJ32PWOiZaYfrnsC4mtFJ2nwg5neaXbHsuJKxZZHQTjfgmzSSP6MBjGw6IJWBMFKCs/0Nq5d61LxNO1VMXFutnKTCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788936462; c=relaxed/simple;
	bh=QjPDfY8HUX1aMlWrIqvKTmWKvq6qJTUY69IkdKukLbA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDGaq9ltajnsAEXXlCJr6mcxvDAzMpNxkzTS3zhwnMDEfzqFAR5pHfZbQfrQJGUKqAp/idu0yBTZIUENJLQwnj7QrcNzfoCSuOoj6tt3yxNfPo6bbnx6eFPrlUryHLQwIbifsMcvsLBxTgW/exMvwwna39pYcsb79Cdql8DcOnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmSRf/TW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmSRf/TW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-85590c5aeabso3845122b3a.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 23:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788936457; x=1789541257; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PiRADsgEtjb9wVO+PPwZjDl9Sb9Qx/bxeGIV39F6Vss=;
        b=KmSRf/TWP1JDegU3XHWx+Hb95LrIDy943pIpMUI30Hp+SABFanXh/8dV36DfVIs3Hk
         cmnJ+2veYCPwSKRo1fwF0VZaMn4PyUXpGJomnOncAwGXv7lpsSRGfyL5a/JWIHxVYky9
         /awQUPFzQdenwqfehiUhI0bVdOF3RO0BDG8Ed8TUCL+RRk54Il3l5h4IOkxVRFgIAV2p
         YeSxSz4Wl0Xd265w/A+tQRgNFixZokRzo+NZAno6+z4wzzrzsVeRyJgblnvp7djQoWtB
         lEkwzCkHrTd6wbTUOqVG6Q0HLwK08yYORC2YNgdwoxBGrvoESoee0o4Dr7ONrfe8WyJW
         P1Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788936457; x=1789541257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PiRADsgEtjb9wVO+PPwZjDl9Sb9Qx/bxeGIV39F6Vss=;
        b=bh1SbPW/P89yIWFFkd3CbQzmgAXqy74vjponn8VpkSQUbHQ6Bp2bwZD++kCB4eOOBI
         HdYaiQ3BSPTI3JEsKcwD8lPsvU9shAlAg97Y2NLizTQJp/aYlrbaOc7Yu05HYqdN0wfe
         36vOsge/kUpA6zArBgTeGJbutVvksKmIaCuSr9uxi9HyJkXTUar9CMLh9sZehUS3MUvi
         6pLUgzeex2oBPvbmEAHyl1prSPITTVHqW40P8skFatpWZsrq4Hd87weaZ1AphVrIvQn5
         EvIAcL9tb6+XG3QWGMk0ugQ0ksOy+GA6A3my7P7Yvs4aqc9nszfFVQOY3Py4VxmtMlu+
         uUNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlkruzvemidB48t/CRBHVnTmt88FauUcAVVPm+eOkZ4/MwXzbP1lcDV51gNzZDARzv5s0=@lists.linux.dev
X-Gm-Message-State: AFuF++nTbawAZbKH3JxhG08i8vqvp6yg837IectKKY3GllHpswnBSeB4
	tGV3VkJfoAib0TT4ys2TJ098rgoyHcGexNSVhDrQXB0Tmjzl7XYIfIS4
X-Gm-Gg: AYBFou07GGPyTmmXhp6Ln1BckQSXFqvLKzZFwextwBLxhztnJa6x8qlKDxj9V6oYs0j
	FNuPtjH7ck2tsZtSjgS6Y++4VuCHlFJ801aBXzOy9KPDS83cacZDlbB26noUViF62dGUyw5NKI3
	lMqKRHkCIiL8AZYrNMaWmGtUVMz87LV6vCiUWYibETBxHcSSEmysq8qILnJl7uL+RLnBKkB/F7P
	Q9mde34B6slK6Odor/aqnIKCoZAVFGMAIdPDGoHYSHVAQAlXZZtceUrq9vS6NV/V3CtBNRlF9Ax
	KWW7VX4Qi2m1+XafiXSyu09ORzZvm/hRI4pqD99J+WdSpU1ugAEDswoTPHLTejEkDeqdzRDXLiT
	MtyJvwUDKeB230LK89fcDYBFl15z0UzIdMnG9beSPLhSbO+H3R4asvrFWf2GNxYze5gbQVtQnpG
	1TQSCIhKcRlJQhq/cRtKEJdF1ClFKGVfJAf3Hotd8+OFesI9lVQ448lGda+7gtKo91E45M4iG2W
	y+2rK+e9ELA3CFO+pgqvSMsDLxZebQpMhEChkw+AxByndsd56tROxMH76jP/u3CZN8hKpC5qj1u
	W5c3IJudmYkTSlM=
X-Received: by 2002:a05:6a00:17a9:b0:857:7317:cff4 with SMTP id d2e1a72fcca58-8616a867724mr47261170b3a.21.1788936456799;
        Tue, 08 Sep 2026 23:47:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152045e8dsm6406973b3a.20.2026.09.08.23.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 23:47:36 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Stephen Boyd <swboyd@chromium.org>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net v5 2/2] net: fec: Handle optional IRQ lookup errors correctly
Date: Wed,  9 Sep 2026 13:47:12 +0700
Message-ID: <20260909064712.22539-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909064712.22539-1-phucduc.bui@gmail.com>
References: <20260909064712.22539-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Handle errors from platform_get_irq_byname_optional() explicitly while
preserving the existing fallback to platform_get_irq() when the named IRQ
is not available.

Propagate errors other than -ENXIO from the optional IRQ lookup instead
of silently falling back to the indexed IRQ lookup.

In particular, silently ignoring -EPROBE_DEFER can cause the driver to
continue probing instead of deferring as required.

Fixes: 3b56be218f65 ("net: fec_main: Use platform_get_irq_byname_optional() to avoid error message")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index c6e29b5c2abb..f7636f23d1eb 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5397,12 +5397,17 @@ fec_probe(struct platform_device *pdev)
 	for (i = 0; i < irq_cnt; i++) {
 		snprintf(irq_name, sizeof(irq_name), "int%d", i);
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq < 0)
-			irq = platform_get_irq(pdev, i);
-		if (irq < 0) {
+		if (irq < 0 && irq != -ENXIO) {
 			ret = irq;
 			goto failed_irq;
 		}
+		if (irq == -ENXIO) {
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0) {
+				ret = irq;
+				goto failed_irq;
+			}
+		}
 		ret = devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
 				       0, pdev->name, ndev);
 		if (ret)
-- 
2.43.0

