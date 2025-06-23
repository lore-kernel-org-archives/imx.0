Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710E82D238D
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750701424; cv=none; b=Mho81WlA0RfqfBP9kr06+LrZm7E2eW1cpa5xkCrK3RVrza4Uq4inSORN8k3ZogbGPmTrXVyajBfv5e/chp7cdbB2HDySeIVHWeqYG+AwJQ96a+uHSLdJM6ANc2RafMS90Tnn1nw8mEZQivOyWl2l/fp3K3A00atTec+vUcbeM1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750701424; c=relaxed/simple;
	bh=iqi9+lFhwuVbsEJqB/2U+YkRVbQ2OOdsUUnDDZxkbY4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E5Fbz/SaXah0RXZGDqjdFFc6Qd8P7wGudISJ/vKtHbFINqH0BUwIGGhLxd47+Hk8lLAxFccWSsU/WC5EOwg2gPzV2Bk9ZElJDPVKETssWbBkG2YGcj85aU2gwixPgCtNoGwH0ighr08Lo/MA/ed9WoNABT3VDL+K6qo02LxOPHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RUok/YK1; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RUok/YK1"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6097de2852aso5794403a12.0
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750701421; x=1751306221; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=;
        b=RUok/YK1VPFhX3zXk+FukDWQxndPqqA6bQvg7iMIJJpcniIFw0l/H+ZtGTqc5QvpbR
         g/qKO0Un24vTBnie/1h624uLlK7Kh5pRyPrSvZcl8rlkXGImnNk2/T/9tZYmKu60+xmZ
         Sr9++6BPYIYHjG2XO4zsNIA7vPAzqVDDDaZW+fFQ7Fj8+0AkeZxLJDzWz+VToNCLkYX1
         q5sncTDppl8w0EEYezfxbjh5ErIqWZtlb3RodCNrD0WNMAT9fvAOadp2eb5+S/x7aoCH
         b8MnTaxeXof0azuywt9G9honu3CobIry6Pn25BVEIAoU64Az7Auzm4/MEQxw0ti4/J7O
         FQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750701421; x=1751306221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wV1xdbkNsJPajHeiS4I3l8fMjaxYCyZUEva8YqrT++4=;
        b=pFIJpzgqLFI1o4oeTF/uyPXKAthJYjlOHwRA7rXobUIbJVpowTN3IHu6gZtw3TtLdG
         N2pyfUjk/yeC7eOcsVLkjFj9PPWdXrMCVig7by/YiDqlj6aZqujz+KKJTfXRVTtd457C
         HBxTtMGWMNWz7G6CL3ASmWzXwcwMiWrIH2KaUzGGLIAIW13mSkCtC+u+H82zCVLRR9HR
         yMPRJxhS/hgl5hu+nXm6ec88mHQV4QRa8PEZT9V3QudKEcCah0HsvxfY2uMAquWf3y05
         ifdZJEpKo66uT7EYIOXLwuiIC+gAwolSRbLNkIE1KmDgwpjZJ32Q/Nv1oPtBiXrgWuco
         L6FA==
X-Forwarded-Encrypted: i=1; AJvYcCVxmJMYjhPbbwXcpgP7dILTKE9CKfOnSnmBRhePSp7gljaOsdtPylyeLprOxQTIpDUOFuU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIcj1livrHUMvPE8l9gvrFpbaL+IWLw+Y41aTf6fCwn5i43nfm
	ql44ENhZw51nHeGSPvaqp8B6Lw6n1QZDDVonfqoX9q0KEhM/gUvMVMcK
X-Gm-Gg: ASbGncsNSHyyjgbtP/Fyjf3kmSM7aZ/S/No1RzPAwDup3GRIAU5fPxmMMvLwj2vvkmV
	WuY0s+PuSOERy+cNTPfLgHArnfkQlaCDNZwhlOU7OpB59kPMS1jfkhCVJDNUDrJFZD2gsq/WBW3
	Pe6VJuCjEqRFbls4kzKOLnHKeUK1M2XgK7WrJzB4A4k6q5no7gebVlkNjiIIIVhSzs1WB39wNAI
	oTP9HH16qQJOyIxEeE9+/OCnkeR8s27yUx7Awd/r8B8aLFOoHL44ngdFq18PTg7+d9BMF9/ZQwA
	5otVn5LYLQNYX3U/EQSyNfgvUfG1i5ngbnXzfYBR3HY2+Nw2sbUMpkXS6xbN9gK2xQ==
X-Google-Smtp-Source: AGHT+IHR5nn3u6Mv7ocbuLDN61MWU9EZWoqVXA0uTBbGSLbAMV2C/+qnL1ce0DHE5uebTg0oqAbKoQ==
X-Received: by 2002:a05:6402:1a4b:b0:602:f026:7cfa with SMTP id 4fb4d7f45d1cf-60a1cd30fcfmr11406465a12.13.1750701420638;
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
Received: from wslxew242.. ([188.193.103.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18cb9e5dsm6360789a12.53.2025.06.23.10.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:57:00 -0700 (PDT)
From: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>
To: Frank.li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	boerge.struempfel@gmail.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: =?UTF-8?q?Goran=20Ra=C4=91enovi=C4=87?= <goran.radni@gmail.com>,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 1/3] MAINTAINERS: Add i.MX8MP Ultra-MACH SBC to ULTRATRONIK BOARD SUPPORT
Date: Mon, 23 Jun 2025 19:56:50 +0200
Message-ID: <20250623175654.844281-2-goran.radni@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250623175654.844281-1-goran.radni@gmail.com>
References: <20250623175654.844281-1-goran.radni@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The i.MX8MP-based Ultra-MACH SBC is supported by Ultratronik, and its
device tree has been added under arch/arm64/boot/dts/freescale/.

To ensure proper maintainer coverage and notification of relevant
changes, add the imx8mp-ultra-mach-sbc.dts file to the existing
ULTRATRONIK BOARD SUPPORT section.

This follows the established pattern already used for the STM32MP157C-
based Ultra-FLY SBC.

Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c3f7fbd0d67a..48af272eb62b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25411,6 +25411,7 @@ M:	Goran Rađenović <goran.radni@gmail.com>
 M:	Börge Strümpfel <boerge.struempfel@gmail.com>
 S:	Maintained
 F:	arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dts
+F:	arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
 
 UNICODE SUBSYSTEM
 M:	Gabriel Krisman Bertazi <krisman@kernel.org>
-- 
2.43.0

