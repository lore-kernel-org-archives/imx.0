Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621961D5AAD
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 18:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729709936; cv=none; b=JiL5NVn6ymPtmILWoSe83TTzg9+u40Tedh7z22HgWKTb9Xo63k8giOJfxWoIjgoSBRTz74BFO2qLfR9S8K02UVkDt+U9KnkakSZIiIsqX2iZScv17hUtVgozIPIXBq7St2kD2G53Vun+LSV9vZrunoBHDUBE0HesqY7p2n4Bu20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729709936; c=relaxed/simple;
	bh=x204FY8czbHAb7Cmw99W7nI9BVzyf3/4zvjGmKOefJs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JaZbCeIZezBhdircDg2gjSTLJ8tv92igVsVCkMWoDdhEB2AENY71iXxkmBaBwVmm2GcJjYhq5dyyza26YXUkhZ2RG46Cf5mPaUTAvkte7zMBDJC2zJHAjSQB/bDNO02can1o9WJ8TqndY7jkqvQ66PSouUkvP3yKqdbMSHzbFUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ckHTQCfV; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ckHTQCfV"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20bb39d97d1so462195ad.2
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 11:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729709935; x=1730314735; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8POc0ozVUT+47lXZs+WKX2u4H7qQ6BvNQLFo8yC2yY=;
        b=ckHTQCfVzxF1BeA+zMQzM5YITvc3zBV2HQm103Y+GQxNcQlbrs9DBFOOWobLHYKMBA
         DTaFcJYXcwOj8MMzssqDdQ0ZW+zLXFi2044gpthPNbBU3M7ZQ9nO7vRJ0NRT9TtOidyb
         AxQiUo56L+jDklLRWkgUvqxnXauDajCDLeK+azc1cdkk+jx5uiq6Z4EJEs6+Zi9aNqIa
         +idgwk7fn/OEypgZWjKvBqfF0PLO8td90XpuvFcIJyGgp43eD/coyiTQke/9aQf+IZpT
         Q7/knJuZpaZdKqjmmJ0SDRlWWQxyDh91VcmOiltNDYDfKapE3Li+MCyug1EmpLFoCDcw
         egmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729709935; x=1730314735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8POc0ozVUT+47lXZs+WKX2u4H7qQ6BvNQLFo8yC2yY=;
        b=ugOSK6kXQkCslJ3lca/YWUauj+QYevP91joQ8TqaUzl02/9vgip40OXEEyPVxtkiRm
         iJmA/gRuXPICfvvy9Hd8lztbJ3qZWhYmdhDHuBxDiYGjHbT3uQ9PKIDmczGj5J9RN5WE
         ppsKvmwRr8baUU5+38FRoAzwBB6WeGzCVNDJdT4uKrttpS3wGLBaExRkbeo81Dl+J4qT
         aNRO6EYmikaRddFi0UrsZzRD9S5txm4MNmT3yBM/JAYTgbcYCxpu5jh8cAqW+jg3ZpsS
         +hPdXchCyBMoKlYUYBxHHFVfnhAlNW8w8hrw8Skoso7g5K6nvAHdcpID2OPy02vUN3UX
         H8zw==
X-Forwarded-Encrypted: i=1; AJvYcCW+MaaYsTjiwD6dEyrVvCjsc1MKGVXseZ3TqxqaYRxQ1m8CZvi6YAX6mcJUlaB4ZxUliH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxFDXTcVQ8GmNfDy5K2VHhJd1sLrXMhPThkXLTxICv5eRuHAJQS
	YWqK8mlCYpCKh71udkUNwLGbTW3arfGaYkcNBERRM4qz03k1CaF/
X-Google-Smtp-Source: AGHT+IHH019wlye4OLyzFgAVfsYnBimRnqGGVnQAULUDSlRjJMvfsgn8n6SH4ioTZQtD+DntZKPrMA==
X-Received: by 2002:a17:902:e5ca:b0:20c:b876:5046 with SMTP id d9443c01a7336-20fa9ea37c0mr32248425ad.50.1729709934726;
        Wed, 23 Oct 2024 11:58:54 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f6ee4sm60619955ad.295.2024.10.23.11.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 11:58:54 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@linutronix.de
Cc: daniel.lezcano@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] dt-bindings: timer: fsl,imxgpt: Document fsl,imx35-gpt
Date: Wed, 23 Oct 2024 15:58:41 -0300
Message-Id: <20241023185841.1183706-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023185841.1183706-1-festevam@gmail.com>
References: <20241023185841.1183706-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX35 General Purpose Timer is compatible with i.MX31.

Document the fsl,imx35-gpt compatible.

This fixes the following dt-schema warning:

timer@53f90000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx35-gpt', 'fsl,imx31-gpt'] is too long
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx35-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx35-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
	'fsl,imx35-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']
	'fsl,imx6sx-gpt' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index a2fcb1e8e74e..9898dc7ea97b 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - fsl,imx25-gpt
+              - fsl,imx35-gpt
               - fsl,imx50-gpt
               - fsl,imx51-gpt
               - fsl,imx53-gpt
-- 
2.34.1

