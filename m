Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5AD444706
	for <imx@lists.linux.dev>; Fri,  2 Oct 2026 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927811; cv=none; b=IHdLAWTUzpRxicddrfA93+fSCXZ5ux2FgHTE/HcqUAoxFqQ+n4uDlvDXPuzddOV9DBzXrU54BRI3K0TjhwNe2Q/dK5PjQTuVO/bk3CDCX7kUPLAlwtTLR39Ixg81vf2oEHE9G/QJlJUPaJm0lZI3vEG8YvaA4t5je4LJ0B9A19k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927811; c=relaxed/simple;
	bh=ElnfxgFhcmeUn8ZIqa/xzqEbM075lUDvBpB/nd40vQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7j43iyGGTxIV7GsC+NboU1d0TNVzm7oRajyeylze3aGh6VQpk/qvVNWMR2gI4rpEwhiVfq+2K3nwErIGpcthCMEUwNjXzn+6D6OxmI386N0VaB9yyYm14deA35Cv9/I6/xQ2FzsapR9t7CRjM9J5m2TNmnqLFnniKK72miOjMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKsX+5+r; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKsX+5+r"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffed768deso21478735e9.1
        for <imx@lists.linux.dev>; Fri, 02 Oct 2026 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790927807; x=1791532607; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=nKsX+5+rItwzx4o9H7B/5RTi7o5KgyrIm+Fu5mCZWwIxssWeh2FtwidQomvZu+XU5s
         B18flrNwAabovJaZGKi4bFNdnvDvkYPsBkrCZch18zeajCWUeIKdlmJAizoSpMWYu65t
         KWeabh+HA26+80HSXYbbj4fp4HUCiPUZPjvjzlEAPdOPkH942+U7iL4+gcu4CdbmQUjJ
         qpMWFRZV/o/i+6zf+DZjrK4OLvKtp0tFqRywgDQeF6BLKFY2IbpvnD0BVrZsEzekGSSY
         ngVnq3HiYQmV1lt723FU+D9lrR0oW4pt5xQxrhEejF9fS3cabA7vvHi139HJlnnicCk5
         vDGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790927807; x=1791532607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=QMX+2PVL8j+ylPq8qXlKgP4l+HdZk/Ky33geICW+WAC822aEsi1+fNs7FlrwjM3Ydg
         zTQyU6q5mYwNT60/iF8MMlCQUSaAaxnTAz7XD/6GWG6U+63TVrIgJ3poX6Y5AkZHdQDD
         ShyyV8pMHeXweIjoH9Vw+rtJ2awDKePJAGHqf8/mOsiXem1WhJv/mXxgEWYt5emdoVoA
         M2PYwR+VYXXv0009j8RZh29jM1I6gubU/3mdVBmAJ2YV+ZP1/2zhNP4EQpse8NdXaFPm
         pRxfcraid+J0eUczDL/ixTiQM9Ps7/VRAGErsYXGePTSa8GxdDfcCJXic7YB5BWIEgC6
         AHVw==
X-Gm-Message-State: AFuF++kWbNHlujEmivsMKtXTj1TIxHr8CZWUT28FTr7P4gz8nwmJuSY/
	U8dBpCWTVKYFho4NOxbhsoRRf0z2DfhF42gx9F7cbW2uAWsGjefRu96M
X-Gm-Gg: AYBFou1RAwcslRxhcyGvet76NPOdpb40kGTbt0pphEnzGOr9ojLjE1+9eg63RWscFNb
	s9uzBcAdg00Of6rFYtRim0cOE8fbhHEZMzJpR3rVuEAIyi80Lcx41hK9EXv+a4u9fNJQ5cE+Q1M
	ss9AAzdGUTCZu8GivqbxK+yvroZL9M2mIKybflGa/3kwvMVcX/UJvBBoeUlAT/CLABUrTTAjkVJ
	Z/+WQMswz8U83CD+aglFJG7XZr52Uaa19vGOJTc0aJ9HqVKi5RixslENH80Yz/HgDVbaRSXZQ9l
	TKjwb6nPcLsL+434nKvC4Maop9jp9wSJIapyGCqxeDBX+4zETXNqFzozUnfkKNnGlNcIbs8uuYo
	bfyPJ90q4UPbM1VUFKzmn3ZDW6+8+kcf4QQhAzhYhEQw+0t2fod2PHbTB4vG76M6ahMcyezl/Iy
	t1WCEzlFPz164LGTZLmQTOLM5eVQcd8UteyKza6HztoXmeeb/YxWTZKtIkBXiPy4Y1+G5qP2s8V
	nzauMdzpmSDyCMBeTCh1nwX9uiBcuMe2C0ftkA0AvYSkKs5s0oHxBW5hFvU/TpNlbX6q/veqA==
X-Received: by 2002:a05:600c:548c:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4a027534bd7mr31406145e9.5.1790927806666;
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0280be5dfsm63635305e9.7.2026.10.02.00.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 00:56:46 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 02 Oct 2026 09:56:39 +0200
Subject: [PATCH 3/5] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-smarc-imx8mp-display-submit-v1-3-f578c63fb676@toradex.com>
References: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
In-Reply-To: <20261002-smarc-imx8mp-display-submit-v1-0-f578c63fb676@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

