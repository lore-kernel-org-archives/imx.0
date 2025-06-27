Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5572E266E
	for <imx@lists.linux.dev>; Fri, 27 Jun 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034447; cv=none; b=iQTNodPWENlUgrllTSR4prCPpOcTUv4BY+iso3CLYDm+/BOJbuQ6M0+dBUnFoXXaofiiHqdXm13qLqY0Sg1x2eHk+Ay+x4bG+1EoOMCr39FosmviGXS/BvoiiQyxR/IKrYbZDpDW2HCU0R81kEEo5bDYZZ6oAvzyFxFMo/bLzw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034447; c=relaxed/simple;
	bh=PEyK06Qfr1VyeAoDqJeLSwQmPFidFt9WX5l7nZjvups=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=thpsM9HvZXWpm8ZpUfesny/shr7ppWb4Ydwl3hitOcCYfsWiu+T2Rd+PC7JgUsuaLLdPHoBtoYPnkpJU69/9HpG1/xvmqlG3RP1y645dV8rIfjfdkvB6UTJ0UXzwCiSlLk+q2q1iAHILuPOmD/NJ1pPVO9M64+DRl6z7j4Ps1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJ4RjpHq; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJ4RjpHq"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so337245866b.0
        for <imx@lists.linux.dev>; Fri, 27 Jun 2025 07:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751034444; x=1751639244; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=;
        b=PJ4RjpHq1CIJiijJB+dwwUtZqStLrLs7NQDZppHu++IT+EUqgcdPLckZlSN/3Alc5J
         hP4t8LdbATZfqiTr/UbPSvw2GpqaLCL3xUbkK1zbWRHUam7MO7tgl+iTLhs2rMJLogd1
         Oim8tAJSsk5oh699TA2xjSgx97LaZCVSV7v14FgRb8ei95sNnsv7TD8fYRPhhJO9+O/2
         wFTAYZsyNhPsVYbhpTONxsFKahHwdk+n1bukRbXOsuX271YTYFyG/0+oVGkrj4R/WxnB
         v9c1nDdFBuQsHNej0mjyunSD7nM7NEofwkQAy1iIIDjaS+ozDIqES7YEZWd5nA6bdzox
         fxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034444; x=1751639244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkxeU/GduoWntQlLaILsmti/MYYJWF+ax5S/V6THsN0=;
        b=D/ltDCNC0pk3z8M8FTPDCPnlVaH73kpAb5Q2NFatRFmn6I3/bKW7+2bSFWZ18RZSP6
         5vJpI9BExd2twqLSJJJoun5Tt0Wg52+zdd6gdbgljGdZerxvGJlQ/KoGubcHb/g8Vh91
         MIpR9xyuAa+3+zAXvTFdYC7xXbxr85Y9yUzo9egJJ7oZM+8l0fTpcCxks8P/wzx1U5M2
         fZ3Oe1/46yuGIfN8xu9G55eDzT8YKlhbgSv0E10+O1m5jWmo+mk7MApVX/GHTLg4RiTK
         fs6OG6LABvFtKAvEWDfP0LBqy5VFAh23XNS3bWCYO9+m/qfZVAipkud1HUv86xrj8K//
         1+OA==
X-Forwarded-Encrypted: i=1; AJvYcCWdSxSIOe3EmwPe/OW7rcxpoHKjjOrOVKIcvnnuxvih5ebEP1pjfbr+cMZdlonzkytQJfE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwghhUkRcTsdGegYi5oe5JUY0KIyThUIkl515K4mj0bJPksa0km
	oAj5xfyLTeVt3DacRS0lLASGqgcubezyCAKCSpQ4/MGz68vzpyRZy8J4
X-Gm-Gg: ASbGncsJKkEJte12kQ6vcz8yEDKmnzxsrpp/dsnRwdIKemeTlyaFex27t1uKaqYhgPn
	fvh7cnTXZk2t+vusoR5Y9vMxzGNImGCn+L8v0nkhcYS/ICIr51/SJ9xjofdMrN6E6ceyVIfFqwD
	H/VebYdGy+FY0QjFVq1gNw8b9/JMJLqMMFkZ62+mWGglciZp5ew7xKwVaChB5DuSu29IYWVxR7D
	xF8zgcZrZusqkyUUzzOSIcbwaPUsX83nUlUEW854oGfbEiVbvUfmgTpqFyAdoBuu+VVfRxtUNuz
	MVHGk2PGS/I+OfeatzgV8+Uc7wf7kgSnFOvN3fbUT+t0RDB8Dzt3Nd6fbEPyUkS7YD1OjdEAqth
	S0ZxXNfa837fZeV9zP8lLOysX+B6Ts2DJzA==
X-Google-Smtp-Source: AGHT+IG6eRnkKzksPdjHbL7u+Nuu+IwfYQX57kJVKCXC8aufRZRKJsVtQ1pW1LFQxYsz6ofBp88Lng==
X-Received: by 2002:a17:907:97c7:b0:ae0:c8f9:4529 with SMTP id a640c23a62f3a-ae350103238mr299793166b.49.1751034443969;
        Fri, 27 Jun 2025 07:27:23 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35e2dafcbsm98925366b.116.2025.06.27.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:27:23 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Fri, 27 Jun 2025 10:26:44 -0400
Message-Id: <20250627142645.134256-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
References: <20250627142645.134256-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the i.MX8ULP EVK9 board.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b23bc1e48866..0563e9522fb7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1373,6 +1373,7 @@ properties:
         items:
           - enum:
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
           - const: fsl,imx8ulp
 
       - description: i.MX93 based Boards
-- 
2.34.1

