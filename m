Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199589;
	b=2a069MWhnMfvzywhKsuTJfTWZh/IwBLEovou6ONKK88DPkddj8M3TAEAw4W39majbcuc
	 6hcFVA896CTFkBaKsoQo2xpvVrPZk+LffxtYcMC6rlfcflKYaMGH4IQS4hyRDRxiNoqfG
	 APAiNKvtO41492xXJKx3Z7OkIAypCAgLCxXCbho6Ow9/8U5/3E6nfOGD5mlXQLG+AddPP
	 aSPO9Dj8BCozujW8fN2fVEyvQHs1ED8rpGank1ZviTp+wqg1QQ2HHY/En+pfgtWMKsR3x
	 RBTBiHcse4jYRO92k7VFdL9fJ4rpbFbMQqF6D+Nsm6FmHwLADd2qdXcoYbkPrIrW9wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
	b=PGvYJ6yf3FfphOhL7xj17SC3FOjnQU5TD3E6VfKJrEHmdgNfkdlyQ87cWzrnQPpGDCEh
	 Phe3gOej7vidpZzPyBnNgtj0q9ptxdma7fy3CKtvsVp3kSbpRLDuK3hmZAo5pfuu9VCYl
	 ovq9qwxZi9bz0qYnS2v7SoZBXqiM3GABEHKJ0IwfFOhdlbMB1Dg7iiKiTmdePZ8yg8oN/
	 wahGpXSPyTFhDjjeviFYlqKMXAGB+ydYXD3YAE6PDS/9JlNACi9kdK3S0foq9oVhS1uVU
	 wanIG93EqD+FJpp1mTT4xuo9Ga+XgBSRCFgGhQronAhuUTxSokFR6nv68IO3z/mjL5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQxuyeYB;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AD560A2610
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2AD560A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LQxuyeYB
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4acb44dcd7bso747704f8f.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199586; x=1795804386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=LQxuyeYBBVJsD9EsV7OAw//QzgCn630j/FXwEQHz3CAvWCg7gDmqM4TOEW1PdZ1otd
         N+6oe1gjdKtPEG+pZ5vUxHUjaQggGTzeFgn7dTi4GMrgBDlImJIVriXk9ZhklMP/70Rr
         izviuxqyjIKIJQag5Egn/92wQb3CF9ep6k8Y3zsDZrpTTY0zfak1ieir3DSCsqR/meBK
         xZR23c3KI5pOsZQ8n+QO9vibvmTRd96BM9OOAd4VgZ+jzyAZglRzLC+wxUr6P/PFkjdV
         JqKqrpRh8RRlnZ1GzaoFHW/48SAFerviLI4y/UIar4q5MLtwu6iwgnjz/7ZWOWqZK2k8
         iw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199586; x=1795804386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KuqFw3GDTo/1W2MSio8rD5Tgg5f6ICzWtWhjFl6bOWM=;
        b=EB9kswYO+4ZLakwnJMZMECMltjfxkQkTbeD85GFZQCe58yAPzNpavxqlfuhv92OEkr
         dwIfGCJ8nt19uKvrKwRaSWmQcQEocdYkdrjfSgxFkD1fiEips4aZ781RyeziyZvB4dqX
         GcAVP2l5Zdt6DZjO4GOwofkVULMx4GOPa4cj8fdyMb1IW2cYvPG/qBo7GhXjKl7a2GeZ
         sEURYkyGYXRnC/bvPpd6caoCgn245QVo7Q9p+vbIme7vDo2qZeavP7i3TY4nThHm3JI7
         uwLSfMlwn5zJ4v0R9KXWn//lwPd1y3/qnSQ+sGUAYMtstR5NySnF2BDHEj4mYo8YWOW5
         /E8w==
X-Forwarded-Encrypted: i=1; AL+hErEUC+8byeH31uB/Uc5pllgyYJYiJYDmgbNm2nqGnO3gyRdLye/OQ7MBMIkmEZMXHLjrCl8=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Gd/RITkbMqilnOGlq5LYEg3V6N9vjD0THJ0/xSLNJXu0RkV0J
	Q/b/MWnH9BKKt837kk+17Dl97U/9LTmvLEgwlBuJgjWt2uH+YBgNRNop
X-Gm-Gg: AZFdTZc6mppuwdWSbMswQeaCFL8bdsxR7ztF35oMO9YVWRfzQlUE3OhtueqWViyP5Ax
	PjT9U/sjQMfw4T+JGd1qzO/OWLLsKRdfIyzcOxyxqc3Cznsm5hwl6TSWlWGR1UDcRSkYzQe3iUB
	iczps2+7gDMk1+16D9sjhOC84D6lAU0LTVWkfgOn9W+cGdj+3VOXa6awijXOUVIrIyXmeONocXx
	ZS7z/DYBz67WYUVFerMV+s0wNci64RTGTSqisea/PS4bZ/t1WU3iJXHm3mIMkWxGPuS8Ig6IRRP
	i6psrLbPiF9ZKGfSTokAfvrv/InwspKmi9PZUGdMA4Bi31HJKU35zY8nL2ELQo43kxieL0lk+7R
	ihaMeXnsqEHn68hXw3k1+7kOXcYSH2rph7JfAiY/Pmdey86tt3vEyJGkPeC/tPrW8a/fI8Rc1tu
	6bYIcK6IP6DJU6PcSowb+wXSHO8rcymMQnQOXusSkYIBF5HOWbEnAwn1zlVsEtC3zwbvQddX0gY
	iRRZloGgOlBgFx0i1FJJcTz1ZAD9RSpqUlIZ8VLvGBuE3rSOqku6Hrdkec/5A66XXjRIi9BM4Wk
	KiRzvsCe8BP4yvEOp/jR8jzoAsnZ7vpG8Etu8Ofzc9vr6eUr0OeSUSw5OO8M6rHPYpd8eP0lSOq
	WNUivxAEXu0qNC3XQzRWnGhIaTq7RH1rmo62be0plrynVljIo8YhkQhU5Kcw0CBIT25mP
X-Received: by 2002:a05:6000:4541:b0:48f:88ad:7b54 with SMTP id ffacd0b85a97d-4abb2169969mr6420016f8f.19.1795199586192;
        Fri, 20 Nov 2026 10:33:06 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:05 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 1/3] arm64: dts: freescale: imx93-var-som: Fix resource table address
Date: Fri, 20 Nov 2026 19:32:28 +0100
Message-ID: <48a008ec1a785f96f25c3b6eafa2869ddbdee0ff.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX93 RPMsg firmware copies its resource table to M33 address
0x2001e000, which maps to 0x2021e000 in the Cortex-A55 address space.
The reserved-memory node instead points one page later, at 0x2021f000,
so remoteproc can look for the loaded table at the wrong address.

Use 0x2021e000 with the existing 4 KiB size to match the firmware.
This also matches the resource table address used by DART-MX93.

Fixes: 4ce623d9f1bf ("arm64: dts: imx93-var-som: Add Variscite VAR-SOM-MX93")
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- New patch: fix the Symphony resource table address before extracting
  the common configuration.

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 1f0954620195..78b19d8918b7 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -107,8 +107,8 @@ vdev1vring1: vdev1vring1@87ef8000 {
 			no-map;
 		};
 
-		rsc_table: rsc-table@2021f000 {
-			reg = <0 0x2021f000 0 0x1000>;
+		rsc_table: rsc-table@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
 			no-map;
 		};
 
-- 
2.47.3

