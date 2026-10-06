Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E939657A
	for <imx@lists.linux.dev>; Tue,  6 Oct 2026 06:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791266501; cv=none; b=jE6g0fJRHreOBI/DFEaNzsGNvzYERkmumy/BZW7n/G5sGgAH2jqytCNtimpu+NSK+SySGAawOtLY0R9+URXElCUv8Fi2IhYIbyH6G6vOxOIHxgfguo+D22MILxPheDdXspc8GImYkGXoh3hEcomAKdlQczdaaMaC6XCBkhr/oog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791266501; c=relaxed/simple;
	bh=TrTox7UJAfPLlLcucglObe+/FpBLBsP1DqhZV/QtubA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rd5bXhen6XJFk+NHWI6PS8Z/53qESeGidyHJo9QRyziNFDOX4Ji3ZwTE4j2ERQ3ci5pDAMVmMtBN8qTyjnMDAvi0mWZlI05vnyczmcgMRdx44DZzp8b+1hFCooVj1tqIJE5BNdicYT83NdLtrga9TKQcOVsFaUn+2jv5WtToyag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf6T2rUo; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf6T2rUo"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1433e7b057fso1464085c88.1
        for <imx@lists.linux.dev>; Mon, 05 Oct 2026 23:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791266499; x=1791871299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=;
        b=Yf6T2rUoQo4QkiqjwXmi5fAEJuI788Htxz/mc/eq3CO/LxR4Q/JzZrSHXYohKwiLdd
         wux3hWUQfNjBhyhvZ5tSe+kLD0fw2yjE7N7X4ziPmS9R2he/ST9lOfF+sW4teO51qVo9
         c45WbRcB506/HAKOzznOW+ee86CD7wjP9J/+Mlr+NwoQ49N5zKNnc8bPShCWvSPlZEBX
         Oaijid9nOmnRW+AgDvPYpHcoG2cnInDGt3LzlpXxXv6ADT1MEb+jTe7ev3GjRvisoDlz
         ZINQArJo9COgiFQ0J1ZTMNQdA/yisGNwyPIK4wtOBqoxvs8EAh4lsv1mFpLANkfTL2c9
         1J0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791266499; x=1791871299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SS1ERV4sWn7hoBzl0f2aOYvZXShJQi98daPhEwG/R1I=;
        b=wf1yjOQYVQd38xXI2uNA7rVdF9UBTz5WkgH0SB7E59uIpil0MGWPNApiUW/MEOPHW2
         NmrkRFmUDnlBUL8bcTXPjuL9pt+5bdCkIdgVuU50UJEdjHJuEQvgOIUG1AzzVmU4V8re
         vK6uxVeehaaZdy/xMscaoS8JigEWsU5R0JuBK5Vpgnet69cPyUCE2a5ScjfSBPcrboY4
         zgc00pWj31R8NnzA+GAf6xyLA/0ctkn85RCWcmHGsSpxbOm5mLoffIgYp7thxqDssKEx
         pFh9Hd8uvhtfPgN5Z/1W78b/zErOrJqzF67PsW1NSNFQAGGrUvSHlcVnBivNF1RWWfYs
         577g==
X-Forwarded-Encrypted: i=1; AKwUvBzqO98VvxBRY5aYxcKVCpmOdLhpGM32ZhZa1OCQH6UJPFNkbkWZjJFoxne/H7r72qGzjI4=@lists.linux.dev
X-Gm-Message-State: AFuF++lQVgPDN1JxDEloiYJerHyNHxkgfu0t54PjEbEahBbUKHpPEb/a
	qUgyl0K2ebrhSF2DwRcMcXGdhRiCjU3PSDquIvOnIOVKjnPTsJHeWjmP
X-Gm-Gg: AYBFou0D+W5rf+F3YnR1H8QYdFS75h0ZrvfpLcghRpm50L1enZSi+xKJyoU8mN9z7xC
	g0CYtEezpkYlGZN0ay71RVV+/rCfW62hd4YStcxDoLz7uuZgSEvi/Iw5WlkImWrejnXOYK1zght
	wxScri7K2o0RVOw5oLtqN9gSJ+V8eNH+MSq9Mt673xdzzGseWQ3OaRGy1DnwUgatGpnb7jkP8az
	QjlK6tje5C2Gg6ea0aw8iuzlTsJuKRaIdezcChqZ1X3/hFek2g3Erl/vg77bD/t3NrWbZ3Q+tS7
	OMuDO1OvXuCPywqkOBl4Rc2Re7N9/qgeOZe7LCUpDh/sUKwCkxxc4hRdfp3tgLH2f06FCQ+1QD7
	O+LOQ1BrmHaVhZZBkk0Zh8C5QfLcDg03uTGIx+Sixt+eJxtqTA3CPWPRYuVxCrqFrsxTuEYF1Yt
	yam072TLGJFNEHO99GeoXRpYjclwRXTnaYIc9dckVxCv+Bx4xOwawjdZ3CpSdcDfruvZxKP66fx
	TJTUypVvq5XoZpR2UetE+iUPQB6OS5Itw==
X-Received: by 2002:a05:7022:f512:b0:143:8865:cca with SMTP id a92af1059eb24-15eca63fcd0mr601967c88.22.1791266498776;
        Mon, 05 Oct 2026 23:01:38 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d819cbed6sm7682867c88.4.2026.10.05.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 23:01:38 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: imx: fix typo "interupt" in comment
Date: Tue,  6 Oct 2026 11:31:31 +0530
Message-ID: <20261006060133.43320-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a typo in a comment, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only a comment is touched,
there is no code change.

Assisted-by: LLM
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes (v2):
    v2:
     - Split the single "ARM: fix typos in comments" patch up per platform,
       so that each one can be picked up by its own maintainer.
    
    v1: https://lore.kernel.org/all/20260907064849.23086-1-hemanth.selam@gmail.com/

 arch/arm/mach-imx/suspend-imx6.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-imx/suspend-imx6.S b/arch/arm/mach-imx/suspend-imx6.S
index 63ccc2d0e920..3f8670296358 100644
--- a/arch/arm/mach-imx/suspend-imx6.S
+++ b/arch/arm/mach-imx/suspend-imx6.S
@@ -234,7 +234,7 @@ set_mmdc_io_lpm_done:
 	 * mask all GPC interrupts before
 	 * enabling the RBC counters to
 	 * avoid the counter starting too
-	 * early if an interupt is already
+	 * early if an interrupt is already
 	 * pending.
 	 */
 	ldr	r11, [r0, #PM_INFO_MX6Q_GPC_V_OFFSET]
-- 
2.47.3

