Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879742253A7
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588875; cv=none; b=iqV8fKTopKiFagtJpUZPCC10V0auUIxzP7subtPgWrQD6BV2VzbGrNB5IWKYed/ZpdUpDNuDMGusK2lPiHA7PUjEs1uUgr/QyJPEiLPJmgKpavdvsQbbPG7SIq0o+iw5BWAc8xc32DNhp4Bov6C6nq18ARmCVTQ66NLZ/vTcw/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588875; c=relaxed/simple;
	bh=sFeqh9nKZoEYQ+a6IXzXR8geyg5sacchQjdojt4E2As=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YTuDK5D22MTSbgqVrCbpHz9Zf2eMlSVNJD1I3c/IlA/Fkhf6geFMQYuHi5T1vdzfb33hppLM4TVod0yj9I2Ob6nZWFROfG6wGY47X1rjD9WwNmWceUY0zNsom9/Ug9AasPpavBB3H9LAmOytZt3SW1SSw2Y0mrqJLiFn4nZoq40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5fjTOEk; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5fjTOEk"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4394036c0efso205375e9.2
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588871; x=1741193671; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZpy5GPgAtfFVvCtInpJGMk0J6F8LViPBE4i9el70qY=;
        b=G5fjTOEk8+Fx/IBaDOCaCk9qNSWm2EwnInlZSKvR0bwL5MbaKHMSrajt3221NKPZTh
         k3NJE5ESFdGPt5QXsHTHECrCJpIZyteS50fh/MmkzqEFhezK1cXtQ8S9jqG7dZ8pJnMQ
         ltabf4KguaoLzHi4skD1mpgBltRyr9Vxyo5ufuPLd6G53kAtBNGY/xisEFvOQqiAOeHr
         WOsP72QEsw1RqWrk6Uy8oFh/ZlvyBM4ZgL23W0lTLW6Byr3psDwg8d7r0RPq9cn2PwIr
         u64MsjxuRs2OduSX2qfPRJ7yU2+JAf70dYgWIr1KecEFRC4WMqxeQomEIocmQWE4oiNn
         CN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588871; x=1741193671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZpy5GPgAtfFVvCtInpJGMk0J6F8LViPBE4i9el70qY=;
        b=fzh/Xm2M5o3O17bY6EizUCZgpoJHwOGHap5+d1eCHn4ELV6bEyyCN7Ejyrq9LxQNXX
         ULnLISDx+lTJdD9WBZU3O0fnBzN0q5glQL73A7OqBnQFiTU3JK0WyUpAoU0XL/Qv6B+Q
         N+u/O2SuCj4inn23MXzsav/5ETij35i4bEXC3Leq7PhdJHDnYbHD6IyarLoK1UO39Dij
         HdicAa4M8ouIH2JeTd2ThQ3teEzm7LMz4kUfwl9Wno7sOzhx2FLIYeqh3+9sDVdO3xi8
         QDt0Hi5LPyLdlZxmlDPCbsr80Egkk1mcydtC92Og5AR3cSHSH8U+ax6nAgFRYbNXO0vc
         Xy8g==
X-Forwarded-Encrypted: i=1; AJvYcCU3jEESNk25BvEENw/ZnTmE3ou6nKbZg4zLTnGsDSOWn58qlf9Vt1c+RRUCUn3lB/hINi8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhCbAZA9ciz67DWoZlkN/or0pInAsWfyPbiqPEJCOaBhje0dpt
	NnmiOk1M/CM+2yt4QLdxHaUnpUGhk6a6wPY3/WEf1VPmpyWBKsqa
X-Gm-Gg: ASbGnctPComMzBqq73ndifCk7zDCBbT2RHmGt9jdzGDLCbNUIR6+UIsF2eOoAnvk6l7
	S4Cmg7BrXJhPYBvx5nPv1gLiu6XJNZWCjGXkVc2YtWBoJREu64qCqqw9OVFh4gXhtNIl0l0OroG
	XBZlUGokKyZKMz4ECCB/FlGEMtmVr9KC55Gob1vsz0mueLQO9KxsyjXaHqCD985tLwqeQTQhrCO
	kcT9FMBPWoLt3gyUvqncPe04beEPVhuaPzRinDu7sGqawQouDE9njpiyPZP8E3vyt515E2fPYpi
	1YvjKWg+Ug5t2p5FzqbsWISePYtA8v1l0nLGP6wy794FEdOP3vcVMz1GREZDWYLg
X-Google-Smtp-Source: AGHT+IHImZk8rItKoGgyrvgUbtToZbbr8RHyX95hu/4NZrjTjx7+3Bt9rfSiRS3zYUPBD5ly6hBYtg==
X-Received: by 2002:a05:600c:5123:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43ab8fd8ee4mr38322665e9.7.1740588870582;
        Wed, 26 Feb 2025 08:54:30 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba587163sm27672515e9.36.2025.02.26.08.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:54:30 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/5] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Wed, 26 Feb 2025 11:53:14 -0500
Message-Id: <20250226165314.34205-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
References: <20250226165314.34205-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 3097acb4bd21..3550e44d00b5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2423,6 +2423,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

