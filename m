Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBEE14E2E2
	for <imx@lists.linux.dev>; Fri, 26 Sep 2025 01:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758848687; cv=none; b=K7L+OTdUV1cFDjcBe0LuLzalLo7/Iz6bxExGsDsl8yuJ4udN2W2CQxzDN3NON2XLFsuRqnp2Izzi6fLsMuAP9RQnAREBf8BnZXdTQnCYeYJuq6M6ZDE17xk945mDXZqlps7G8PwBcmNcON1RaGtW9ifeSzs6J/Rx6UGaA0z4KrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758848687; c=relaxed/simple;
	bh=f+H/QQJgKpGK4WSE+pqHlhBqTQJ5PHiZmCPRBD6StTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KFhfKQwy/oT/tEnhpOMteFyYrD0qU/l8lI79cbirUTBx9SdhBEuVjC100+1A6DpQSAJht81/b2oK+1WMlobYfPaUOoGfUtYtRnHiHg60rNXEyMAaVLkoikN8hzYd8Fteo1aONT+kT9MazwXHpgOuHjOOm/15tjuwZqT1WbIBQvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEeMZHST; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEeMZHST"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-367874aeeacso14640671fa.1
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 18:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758848684; x=1759453484; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c1PTcenWwYJQDqIWAGafXJtH7Gx1jBmVYXi2cXCmKlM=;
        b=IEeMZHSTs0d/mFBt2jQI+SDWZJen6lPpCknK+T0+xnf2KK9lqbhakGIy8uq/39HQpw
         droUNJSu+e4Mwz/pcqdB/RU6YbHsEmVGwfCX7mvveANuKPOLoapfnluhbo2tvq2NGvpi
         DxaU/hSdM+YNIl3WxX070quZhME8whYWRySC7gG5AGwHXqX7iNZHrhZloeNInUWiH89z
         3P6t48BJlaNxZSV+0p8Puocsr3wXKGJMe8t0gHDmUX3e+ekviwLgyMTcn2Z8Nws1O0vl
         fI0pJwc+fgCRJeKOdoFol5csMIdqusdyl9I+JQS8iaLZq3scuzcw5xD5hyGWl6lf7ICo
         iI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758848684; x=1759453484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c1PTcenWwYJQDqIWAGafXJtH7Gx1jBmVYXi2cXCmKlM=;
        b=WIfQp0SK+jXXESD3PtVZvAfjbGQ9XBvjyUuPCumGCItAscDso0Hybthh5Spf3dDN18
         UctngzDmPJPVfQ/na4jBrOs0ClXB4Z+IjB/uQFYjMSo6I1LIgyF2Hum/HWzXZCQMr3Mi
         ajVNVnfPEMfhX4hhcFRpswI6aRNDGHNPnmhDTJsDNceiBDx/K8XVuC8b4DNa8XJkCLn4
         FY/WjTvxmz7NXlP0c26m6y+LJA4T2iyXvY/Xwk1hqhq9xsUE1q24IZ7+A9JJtW+htVzu
         8b+7J6I72vOjuC/SDf0D+WMJ+ebW/yybXo7S9zlXNRfxEwsAVw/KueUyflu1MFL5Er3/
         S2OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd5sqsS5xIYtvFCj44wTYy7hYfdv0kwpeQtO/e7Yb4VZgZJNSBjHjzKPRXgXwrxgxndPM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+6UPE5uGKfl8abH7Na/Su/UzLpndcuW+1AtOX5T3p+gJ+HxSE
	JVzm3DFnMsbZU/2bOs+21m/I+0WcuTzns9NxZLduhh/7EqT5XYwLJBV4qAdlzIkAu8m/kKxLGv7
	7Na6VZuCzt/xSA4CE3uB4YFWC+KP7ETs=
X-Gm-Gg: ASbGncsF+OgEdKugorLPxCyyfHXvQGFrGF7mKRAn4P8QAKu2geRmdhEDGPfhx0yA2Yr
	BrEmz5sRE2nEW2biV8nuQu/iAVQ9tEueiiEKmA+MEhfaaDJYetrJ8RhjX0IBJtFQaykvUWC8Kud
	ki06fmJCKZyrYJNhdOSqYIvklEpKPn04vqqjWqk+mRYmK6xzD1m3DHLHGIMMQAXTN5sZb7IDXAs
	WB+0AfQiGGOlcs2k8kQaQLCicBtLUTkzic312A9IdFj4QH9Jw==
X-Google-Smtp-Source: AGHT+IF60TM5C+nAEavr2hjyLt4InfjHbymmnuKiT3q3qe2EKbyjz8AweucVXMC9Vaf26fmcfOScUPJF+Jt3PPMgBJU=
X-Received: by 2002:a2e:a54f:0:b0:354:8a7:2f7a with SMTP id
 38308e7fff4ca-36f7f2489cbmr16533621fa.20.1758848683520; Thu, 25 Sep 2025
 18:04:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250925-imx6_dts_cleanup-v1-0-748380dd0d22@nxp.com> <20250925-imx6_dts_cleanup-v1-8-748380dd0d22@nxp.com>
In-Reply-To: <20250925-imx6_dts_cleanup-v1-8-748380dd0d22@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 Sep 2025 22:04:32 -0300
X-Gm-Features: AS18NWBj6BcwvJ3vSrAqizOdTksjhpkILyWLhm4qyX1--PNMSLiRuSdyQPA3LCc
Message-ID: <CAOMZO5BVbm+Vh=XOiR9peP0oW77GiqaSNCbawK_j2+_-vFj7mA@mail.gmail.com>
Subject: Re: [PATCH 08/11] ARM: dts: imx6-tbs2910: rename ir_recv to ir
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 6:14=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:

> -       ir_recv {
> +       ir {

ir-receiver would be more informative.

This is what gpio-ir-receiver.yaml uses in the example.
