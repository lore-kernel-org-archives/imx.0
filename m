Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D0C23BD14
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 16:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749571356; cv=none; b=qLN6anknttx8HpWusOJ3OKb13xYEfYMVFwb+ykArNAbjzwUh3Ixj7KFE3NJbqsxwoDL1FHhDXGLbubvBj9Of73JqwPdaW3yvdhPcOUgF5X5bmv5jqQ72M1Iwgyglth2dikjLj61o1gBzdHpMAECo5vgrwHo30ZegU8BqqcOK9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749571356; c=relaxed/simple;
	bh=Awsl7fijRZNRNXlMpIo+LphheeWbL1Ih3YboNOf3cPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nGyvPFwWgH1hxlFcQ02+7RcvFi3DZQBHTDwazQZdB1oxYmgJmN8UYxQrcSXdrPhRW55GI0TWIehpxWJCgEevRU2q5rsrQHeGNuZKDKbLIjevsM/8zAFASCrF/V8veZ36BDDXm2hwT48feuogHO5h9A0UbjepwNaP3D2BNt2/rIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2bTSJmy; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2bTSJmy"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a54690d369so2177175f8f.3
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 09:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749571352; x=1750176152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=;
        b=J2bTSJmyKAzX1yVsJvMjtW53/peZ8YgAODOEHhD/MtdGoXzR5OvbMrhm9LKMAIGa4o
         5XaunUve15qwnU7zYGsxAUGxvd+rbzgaG8cLOUHxKFZeo3kNblhc0dCyjyT4F7O8EReY
         8jbS5w7pOiD1aWiE8WVqUj1fsZjR6/+1RB1zqO4/I664oMTEJud5DsJPAm8cHYjjSQpI
         S8TQmx4d+5csLl/4ajTnVsN7b+FIOBCLuTMvWbcIMnzBj7hFt8oVKJjEQ4kCPFR+LjFr
         r2iR6vGnuVapsJ9vZl6p5f+WLv9yBezHaAejW8PrLAfPbku9+Runu7y7TKkNRTQnMBWp
         RhzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749571352; x=1750176152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBy9QjZf0+4gjDOghZ/ztTm0V0wUCXKsc4ePrWpOXtE=;
        b=eYUtxllzG0WsV3q6QbWSKHD5HotSD+wg3q8yPTlYdpaW4226GgO9TicyuZoukhpeUR
         AUWUokvqfWkACdDjfVKunS8+Z7C9hFwZVRc6ZFfQ+S5RwSFGRnF8smbD/12eNbtbcdqz
         nTCXDj1lGC+9xIFUjIIky51PGoStmFFSHH0MxHuViKImDHO6nwSpnPiVgCv8VW8675LE
         2yQmeyQwlcnaNxJw9eEevQSQjCm3HWf8P/wu8Fp9Mu4qBXI+23R6sb/4Gt30/EoP/27o
         B5P8fk5+tKF0r+WRTMw8UN6G83e2x5YIkJOaaNXMCNW1IDHmE0MQvj0y7QcI5PjBwD4r
         2BDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpY3UZxV8KAt/YPjUcybGEvyOjm+NI2174b2wO+ncxFV5EyXqtOe/RDwqcWau/oVUxQwk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi6a82GSgd0Pjj8J2RnUfhESHYcAoyJ2tTByWbaYbgh3VsuEH8
	VYq3trZG9OWtwVTj5u/5S8wO8F4sYU3EKTdAjOA9gEwNsMaSPxf+Td3Q
X-Gm-Gg: ASbGncsnjQ8Y7JfCoqC2brrJ+gB/sMtjqfSGEP3LV7vH3T59FF94D7kc0fQfnw3aOlR
	B0zQRgQba/laYViYJdIV4Fvm56nVT4qy1oXQZsEjys5qGpvJkEyPAwg2U8G/P1ywaVH54J/qgpk
	MSMT0IDNtf6t1h9hdrRhq4Fgq9DKWMbmV95Uaq4t6zdHW50ZWFkzc21gMI0EjshwJHG/F1K42KY
	6FoaBNCtqInlPByGBYxYlIQjpy9PRqntIpoW/4/xF7j+Tl31G91NNGiIFEgpkPxjndThnpWhlrv
	RNOfX+avC7cAjQt4xX9BVSdNFzlKqzp1bwxZs5SfzSYBdiVhJHldh8pHkZxtSQlaiQ62wuGYtm3
	2NZJVEkOXPSouhRCeVUP9FQU=
X-Google-Smtp-Source: AGHT+IFlLzTJeUuewdTAL2iHVlMGazp305kQFv+kHaCRhgmhrh9tVXxRlRAZrnMhHVuL1e982fCHqA==
X-Received: by 2002:a05:6000:2289:b0:3a5:2fad:17af with SMTP id ffacd0b85a97d-3a531cf30abmr13544526f8f.57.1749571352279;
        Tue, 10 Jun 2025 09:02:32 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm13017806f8f.16.2025.06.10.09.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 09:02:31 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 10 Jun 2025 12:01:52 -0400
Message-Id: <20250610160152.1113930-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
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
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9b550f225856..26efea15f6b0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2435,6 +2435,11 @@ dsp: dsp@3b6e8000 {
 			firmware-name = "imx/dsp/hifi4.bin";
 			resets = <&audio_blk_ctrl IMX8MP_AUDIOMIX_DSP_RUNSTALL>;
 			reset-names = "runstall";
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

