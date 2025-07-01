Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB777FBA1
	for <imx@lists.linux.dev>; Tue,  1 Jul 2025 00:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751329451; cv=none; b=NOmhOegPRb2PTzPYBtNRjv75w5wz9MQSgcfmdd7hGT0da6YpIfwxROKxaU4YBpbWmp8V035BWM65+wKJsh2svWLefoxPnIO2fN4+aDIHocwWW6yo7znbvHw7AvG5siBwxAMvdmLxOT9dcdCG/LH/F6AQqeEEi9Sm64go8i24C6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751329451; c=relaxed/simple;
	bh=jHvOOWZMwHVwUEZKHsrC/eHGLf1BTwGmWSccwPwrhNk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g+t3kfO1oEkkRTcjvRC7CwEcvwKXDBKiAuM8c1c6lba0sRgXOVvgdyMBmSI4s5i+77BCSTk5yu00wMcUX3JUOeE7lvV2fY+XaG/1GfZsyucgDHpufz4IruAsYpXodkotTioQqgPRCisBRPa+VO4e16otuSQWHOV6bzXVhGS5LKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WvgGDN62; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WvgGDN62"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso9520780a12.0
        for <imx@lists.linux.dev>; Mon, 30 Jun 2025 17:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751329448; x=1751934248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=;
        b=WvgGDN62Ldt9KO1dPy9u3AV2IiZl6OXa1Nmltu0sHQpgZ18WJwTmkz9AXMf2GmC914
         AOrPSJTVWDAdpo/n6jbScLcga2qalm7ukSWCprCTC0CvMevOtb0ToDSdz3eO+nsPXOIQ
         TvMcC5yOnuy/uSkU0o2eYOJ0PE8G20KWJLKBgGFfODeQ51iZPjt04RUxMVuZm4SYibs2
         7HRfEB/Ad9/svrNHivP6Hbnuqr+qDv/lqJbPjsYChFij+QsOjZq+Dea03fKZ7Dc5t5Sm
         amGWyyrSYooR7dYDYWCPjIqmVhJr9zsZxyElMP/OnjGHZwQ6LlpQRQQB0J7SkWEh34F/
         BmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751329448; x=1751934248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiDbkL0pY+ZNJZzLhcl7udEXNlCZTVIqdrO+Mdj7eDM=;
        b=SIHiNHUsO4bqx5UoYgUY03ZyOR64ZMJfPj6wYFmSq7OPBkwrncIp0FatZU4igeyECa
         teV8XAuhJ7CbJEplzKocKcxoAbIYSv0hmbMW245IpQvuE+FBOYyt5fovhmUHlly6pQ+h
         EzS3DlGj1WUC8uzHtTMtKn/PtaYYZljndxrr0noXtBtm9E9bl26ybgW4w71331ISoxyh
         VMIPFyQreptt+H0hh8V7/i27apC1AdLz9mkBhVMoknyhZ46GrAqMwYIz5M493M2oj5EJ
         j22lJ3mSzLWJCAE+6GWucyDZKL4CwkQXoA5lzjJWWSxDDg5KFh6GqprlS/4/VDwLvZNn
         ISYg==
X-Forwarded-Encrypted: i=1; AJvYcCXiK0UTeoQ7KnZEw6N25S3YmedFM5HC7omp9QOjwKQ2cXjych26RACYBNLx452wxPDZEeU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu6C4n/u+kVONzolACrd4cMBfFYsPHcUUvjZCFpqHUroXvcPB/
	HUOgEusd0/0nRdCPUXrKaiF+HwtSxnYBUdkf+Y0lxUK4uhncUtvUnt9h
X-Gm-Gg: ASbGncuC5AfZf/5/GG2IGlFXf3QZe3aKdbNUFf5N23SxzZnVs7/vJai5M8XDEmKDugL
	Uc/1AAkGrvK06mEi2HR5RojUfjoWHP2c0ercfmtXPmOcrx8A9NfZ/XNQf/1aasW8r13MJXKD25A
	Tq1SJ6Vzq/ADk89nWG62nEsAggyGjUe1arNWLxRYaYSHnAoydqrI70m52gDQ/60jeFP3VZjoP+H
	gYaKn3VhmP5gsEbEesEil3zY3joaZXDT5XsJO+E0UXFum3kdw7ggd8HaCIyq1/hbNVGcTZGHFiN
	aMYsQFbpZOOcPi0o7GaFLodQjxeJtpfnCKF1ky1oMoN6zfFSo5kwcx2a9V5Oc+21F0XS8OgG1Xj
	fwix5qgH6q1d6dcZCeVQ+XfU=
X-Google-Smtp-Source: AGHT+IHYha9ZYRUR7w04GSYrL78W1NgyppshTXLOckZR4pG6N/j6QycRpKcE2v1wKnchhMgp2lDmOA==
X-Received: by 2002:a50:c04c:0:b0:608:f973:1bd8 with SMTP id 4fb4d7f45d1cf-60c88e9c1d5mr10426160a12.34.1751329447686;
        Mon, 30 Jun 2025 17:24:07 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60e26b7ac4esm979532a12.7.2025.06.30.17.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 17:24:06 -0700 (PDT)
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
Subject: [PATCH v3 1/2] dt-bindings: arm: fsl: add i.MX8ULP EVK9 board
Date: Mon, 30 Jun 2025 20:22:38 -0400
Message-Id: <20250701002239.972090-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
References: <20250701002239.972090-1-laurentiumihalcea111@gmail.com>
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
index b23bc1e48866..683efaa3b4a1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1372,6 +1372,7 @@ properties:
       - description: i.MX8ULP based Boards
         items:
           - enum:
+              - fsl,imx8ulp-9x9-evk       # i.MX8ULP EVK9 Board
               - fsl,imx8ulp-evk           # i.MX8ULP EVK Board
           - const: fsl,imx8ulp
 
-- 
2.34.1

