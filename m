Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C7263F3F
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 16:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742833822; cv=none; b=hdxsDedPXnGx3RMi6R6Yr9csx4KdHAI20JxC+PgngVCV/U6mAvA2Dk2dclDOrpQWebq4Q+MaF99SHMeiJHNsc2zqu+mEItLRXtENLGUT+9d82mnAP3or/o9Wp2wBbKHecSxGFxzz3wH2dtvkansahgIbRoc9OJunIzKqRSj6Q0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742833822; c=relaxed/simple;
	bh=8TTMenqqnPPI38gwxk24+UYMgJl+buQli4nIdMttr4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YW0bQ78j7g5dLSPjADzo0JMWK2fcYymJI0K//jTTHHo6w3j2EVw/3VB2sKsm1BCC7OvYb5R8YZWGUk58veg4iFnZRjY+kINrzpvehkfHl6/ojJ8hcA/N4/zPBEh1+DTafGdUeziA4osyo+yPcbvYSLYbaw34g05IyoryAA1XiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmfoD9rw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmfoD9rw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39130ee05b0so4348635f8f.3
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 09:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742833819; x=1743438619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meQ0Mipo8UgEq53792yFhZe7Xcnc763+mjkb31Obgck=;
        b=hmfoD9rwtavet/plZcYjdMmPMx0AfquHY5JTQ5WH+kXUQ81uJv5OgRJhjXyGZlEAkU
         XTiSiHP7N2IXVeruPFI/1fESddnet+XS7rBB2oTC9cHFjPvGyLFG9/56TqDZ2ohmUXc+
         IhqvmSwYcXi2MTg9tKDQSgDJ/uDr6cUJae1Wu5egwbX9FVo/XwwhstgxVthtp/TXPFYq
         H9ZsaYvvrK38BBMLCLNUHfhFOOlJi1ZsXCRSNs5sJRnfH2DoBpArNhGpL3OOoWHr8F+F
         Xnb558RLj3xyuSY1uvYdsf9YYMbGz0J1jP8DMOQ1vGJ7CiFE1zCD/OsoMFUONd3cwOwB
         XHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742833819; x=1743438619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=meQ0Mipo8UgEq53792yFhZe7Xcnc763+mjkb31Obgck=;
        b=RPUPsJfK9yBjfKJGOjweLvgprsRmH0d5Cu57OBMg7rXsWeNfLUF2fAPYqdDWoCwJfm
         kf8f6qv4gPBBmSYGZJcYbuc6pKr6gMcDezALNHko8/8ZvZc4YRyUD3E2K6iddDBkypZT
         7phbKbx7eUpkH0EsD9hZlDjeSDdzq6PPvStMzzzE2CYNx8aY5YeXe7IEo/zroOe8wGAN
         jL2gG6f1lkcPbsb98LG/03T7wBw0U3cJsnkIfHDuVZPCOv72FIwhHkbOBC7vsdXbiCnT
         wVVi/witKCXL5kjrhoxhM5V0CA8pORNcQJl/Y9bjqY07vd5I1MJOuonxkR6dEbq4LCRH
         7wFA==
X-Forwarded-Encrypted: i=1; AJvYcCWnwIqSwBDrOfYNCcL5XSK4HbEcuZ68xS9ddrv086Z5NxJsuYYjfnUVZEfmymBthpIzmwY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+toFKcXxX3BACAQgWfRoGt2rXnSkujjS8s2m0PjtSQ/UVmURv
	9R/WJ1e2EiFh+zWvyR8o1qFRiuxEXPH6IG4P9C4ORpLDfFUGl814
X-Gm-Gg: ASbGnctjUN5WYPemiALKiHC5lP1vyg91kHfpPXrl4fLS+JsQ1pblFUw/4H3WBQJtt2l
	cIWkQFS3aeFqNwD4FWtKPRPeT7Wt8MfOfqXluXtm+6wULyf6TqxRuLG/QzRIIcY4TzetKjAS24X
	rRSRtiy+UDImlHMFNco8bqSX61SLHulImXwmphQe9wijXeawKKCpjzMWrBwewfTchvJsuipi9Aa
	iuBO/XkC4O+e6ISrF6q98t359n2J7Oqtf/M0ndNb9oQoEqY9OdfkFJAbgCqbQ5gJ4cJtzNZ/dx7
	6aGEaia1gbTj4wofcdnK0D05Gz9pvtZUuuHIIFHdH4B+LSfze/5dnSRjo3iJXl4Qf38WrNCKbbV
	7HL5WbYw=
X-Google-Smtp-Source: AGHT+IE66Gqa84UGtwTooRZYvTVucmMfLSU4uitXios1JhaytT2gQ5+HpqGU4z5hPX3SCx18hnX4JQ==
X-Received: by 2002:a5d:47c6:0:b0:399:6d54:25ce with SMTP id ffacd0b85a97d-3997f8f9cc4mr9475035f8f.7.1742833819118;
        Mon, 24 Mar 2025 09:30:19 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fdb0669sm124106765e9.34.2025.03.24.09.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 09:30:18 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Mon, 24 Mar 2025 12:25:56 -0400
Message-Id: <20250324162556.30972-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
References: <20250324162556.30972-1-laurentiumihalcea111@gmail.com>
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
index ce9f6da1e257..db14e85023a0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

