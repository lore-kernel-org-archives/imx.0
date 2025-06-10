Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3E2281363
	for <imx@lists.linux.dev>; Tue, 10 Jun 2025 08:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543130; cv=none; b=TOvDnGG3ewFa4nzlu46GTD3m5+M+7UDuIMNw8zb0kom6vi/M/oLURyHjOm6W7MPyO6iSAUIyuxb91/o7J+CDPLkbodBlXMDFhTN72FYdaxjuD6E4/pkjPLjmQw8KzfiGwy6lKYnKNNGroER0XVYf6fteHvqizXUf9Bf+JdAE7sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543130; c=relaxed/simple;
	bh=LlCBFvgGHBbep8sr+0DAiL37oJOemIk9HgQQlbWJ7yU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GKdcsADR9NWm3wj7DwH8yFZEs3/SJ4IrFK7+PgphHulYs/zGLRJSk8w5BUDa+/cimwtwlfiBTdHoYW3sme/yjeibwR1KvHihrCkjbvBJ9ge/erLvpHEp1xIsHs+El2cxXDVcCU1YmBdmOqlKZ7zijl1MeRihNGfncd9LUkiVQtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NmPSTzKD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NmPSTzKD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso47990435e9.2
        for <imx@lists.linux.dev>; Tue, 10 Jun 2025 01:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543126; x=1750147926; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVpJs8S/HjaMxfZMJXEcmbSoaRFUt+5llRjDdfcTQ0c=;
        b=NmPSTzKD0G6Iwi+8VJPVLlLfGI6QHezPi8b6K6MclGv7p1T0XDZsLfN0ecOsZKtJnk
         CVDalwEyuTeCZtmbmG0aYN/3GmUYk96Pq6XqY6bY4TU5z2G6RgtSHaFNc/CbtJka5uO2
         QsSjIdXgXZDPWmnlAPxtuiiepCyxCFIuocUcFeS88WA+vJyNAxO3ynCpZb/A10Lj1UCw
         OXt7xi0NsmOUZfno77IafFDdVhP9NZNbDFBaZYijW9/sydLe9ch9DfN6ro7Wv07nI3UY
         nNPGHLxILRL79vh+vXSEfE6uwmQGd0a3BYG0C+f2AxzrmABRj/gmUtcI1BdNGVy4/+LH
         oACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543126; x=1750147926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVpJs8S/HjaMxfZMJXEcmbSoaRFUt+5llRjDdfcTQ0c=;
        b=CXnlcE70OcX3NGA4bv63OWR8mZODY7X5buPqBXRoRBkHizv1n8vVhv+2rXd1DWyR56
         K/06TyFtYb+2maQ7mg2NeaQJlBEGLkLSHIAHuWHqp2r/3OW/El5phbXTLNbDyqNFodfd
         bBftrEpa+zYr+EENAJOzkMrW9oNa2SEfcpCSrqu1JQ0U/PyDeWjfZnundRddSsFUhWpc
         5b8VIGLCbCWLxB+PMKdEl+O5Z5NrqC9Cacn9qAbYELz8iqLYQTyZaMALrKdMJCu9x7WT
         xswRP3Pw24kTXyzX8Y9wb2cOK7gC9iUrjBtWM/xgvbxm69F4bY//AYEjFaFwwcy0l/g6
         KUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUYOdEKLKKhw+0HaovuLWBOZPpia/Z+NP2Rlixxl/gjGAnIgmTLO+Xcw6AYpo6SxZCfMQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzL1t0Yyq44coxC1Q5J3abfVyIvo+h7JVVuJWu7RQt4GH5Mgi+B
	XrXCiZcAxTZcWtawRBaGCNry9ZTxFEDJkvIrQD0VkoDSGfASQ2J7I35qX2OYOY1xX+U=
X-Gm-Gg: ASbGncsw7f2NLzfIH7PB33zLkHCeOAgWfhwUyWaQSc5AyJybeMWuv1f7DDMU9cnCmc0
	pMHBnvaHqq6g8MU2z7uUSCzSODaGfYg7+RRymdueRoig3Are+EOQSJUNlS+ysqM5Y2dieJjmLPF
	77ghuyFN/oooQhFBklYUEuRbE05X0JpPvJVquLrZZNq1gnMi6tnbaOreNev36uW1Afe/9NpQIPo
	3uUfWGjmtun6RkRV21BE4hM7L5f0PcDfdnJWWKG94CDUEtVMbcM1XZH2RVPNbgyjOTcJrnPvcjo
	xv4h70SmW0cT6euPOT+RDVADc98yjlZV2qi2fa15+9WXrqCL4e2kLgZGfVN/
X-Google-Smtp-Source: AGHT+IGqKuY3Cpizdlhx4JXiy9x4C18UAtODglyX5DLPCu5C90go6V8r9W9aiiWBn1UaTTcmkgTekA==
X-Received: by 2002:a05:600c:3e0c:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-4531ce6e9camr20957955e9.5.1749543125773;
        Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:05 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
Date: Tue, 10 Jun 2025 10:11:53 +0200
Message-ID: <174954311120.28634.7991564107488098129.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522223742.516254-1-Frank.Li@nxp.com>
References: <20250522223742.516254-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 22 May 2025 18:37:41 -0400, Frank Li wrote:
> Covert gpio-pisosr.txt to yaml format.
> 
> Additional changes:
> - Add ref to spi-peripheral-props.yaml.
> - Set ngpios max value to 32.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: convert gpio-pisosr.txt to yaml format
      https://git.kernel.org/brgl/linux/c/08894232efa4b53e7cd064450a6d444b92ab24ae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
