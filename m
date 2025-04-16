Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9850E2063DA
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765316; cv=none; b=nXjLc/nvSgmpGOJ67wMPXzkKNOlubCZr1Y1oPzN3JXH1KPjq4/z/2gr/YzhITeMJx4drJGEVeJcM0nnhokJ+Hb+8fkSh/q0SU8QkAyGVl8LjL44nlhB4+VrMIWXJsYtk0mxj9LXESdTTw5aOZ0ettHloLsjTVXzIE7HV6MuXIGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765316; c=relaxed/simple;
	bh=2MOzeayWlccfwTqa1FLxEDzAI5cPyKL90aB6hvk5T1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hWk2uHtodY8m+PHkef4KSgqP/HhUhRHROc+VkmEAoS+qS+w5+0EN4pKhRASv1lXQCWszLrukxavqGwDuTa1DSq6jiSFLOoX++N4+rYHdEB60fEanZxbxnscSlvWYZUieMFxQ2JCI9Y6AMgwk9lUaUiBfCy+ow0CoXfYhPxHeT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSR1HHah; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSR1HHah"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-477296dce76so52409591cf.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765313; x=1745370113; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=;
        b=lSR1HHahNZErjXJ+nbyi2a7Kqm5+jhCGhN6GpxnWx1XfHnrS8YJo5kZRQdNCzyKFmF
         GcqvWTzY4IjIFt0lkVl0ZuWP+xliWCRvTyOtexeB/rTRegtT3+e6I0Dt7luttMTMpyun
         hOd4f/2ZXuKABvVaGHY5q/zHz4oDGt/2iWoJquVAt566WQ0yh3ATkOJdEYadGTAiwGTn
         AnNwWceqjbpviuxSvsCvrfGjDHFmUAPu+wkmKkOIgnnCc3CrD98R5egj+1Nk3WdE/tNB
         QNJrfukv+9SYmx8uh92ofRaxUQy2rsgmUGsrXZGkztdClVj4IvgxZhXRE1a0DICb2PRK
         JvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765313; x=1745370113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I9rF9Mh0w+Kj+uaO05jBBZXC+GX1PbjeGPNbhu05MfQ=;
        b=ELfvcGXmhLZZ6L9emG6k4Nqj2VoH6byKmUcKQlxEnCrz0tqhpNBvY5uW7g1+H3Gbis
         AlbnoxtmdxA/caf5ag5+yjD01w+ZlkJlWgrEiJIckS0imP/WkvVMS9Z9fliC8STfyOO4
         o1kd2ErtwvOkG1f8/fG9pkhOe7oxcncpSLlQ5rDsW+mPu3wDWvfcycpKe10diHmjJRCY
         wbjY4GM0mzNg/arvvQ8lnXynE6/4PRgcH6Hr1yTjFfrrUOM7URTsJlsoH23qtPTx077g
         Lcc+sTsunCoLzEsLljBeGos3+W9EW7b8Oajlmy19N5YjsBCgG/1Tqk4oqB1vNjxnTfWb
         BZOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFWqYCFzeZy1afnb1ouv4x7bFSOYLb977BXEwCpogcFQItnqn0plY9PUfGTr0VXaPRVm8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoJ/k6dhnQLTJImV+lSdEVJanDmdEudkW2SHpooIZJ9J1RA3K0
	xwKv0t+/dWKMmezQ+ZeeaGn33hQ2hoFf9zsb2Quej76lIydXk0b5
X-Gm-Gg: ASbGncujTADojSNQaoxvFLGMPNMv6XZ9BDbRkaaMuENA6vPJCJoDYgPCPV9+z0BJ8sh
	nKfZ8+xjxcbzdPgLgyT0TQEX5sMQBON4wUIEeI029VQxqVM1j3tisO6oH+Oo5Hr99gbdbcwDS4d
	T4waw5PYcu2nllN+LIMF6HRudYcslt+Udkc1mJRLBurhffLGNJVpj9ntWUJSrFIVchRFHH69uCG
	IhrtWGPHV05lY1ahTV6QmCVX6tGnzGQRQJJa7IuX4O39dA1g5rV9GgEV+yobJ/dpvMYrk595UP0
	sN3wk9wXn/WZB4MZA6sYvAuDuIL3PR1bOqY4VOX2TtASVDKUg3pnxM2oC8RyKR/HdJCh9fcYlBy
	VOowox3VTCawWXI8=
X-Google-Smtp-Source: AGHT+IHo8LW4/kQU8vbnG4ZIc93Rt6FiRzzyd/pS66bVb4v5nXdfGqbOemh/k9HlpLvqVxNmTUc+Lw==
X-Received: by 2002:a05:622a:110a:b0:476:afd2:5b60 with SMTP id d75a77b69052e-47ad3a28ed0mr21853591cf.15.1744765313439;
        Tue, 15 Apr 2025 18:01:53 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:52 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 04/10] arm64: dts: imx8mm-beacon: Set SAI5 MCLK direction to output for HDMI audio
Date: Tue, 15 Apr 2025 20:01:30 -0500
Message-ID: <20250416010141.1785841-4-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
index 97ff1ddd6318..734a75198f06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1

