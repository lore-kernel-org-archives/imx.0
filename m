Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D670808
	for <imx@lists.linux.dev>; Mon, 23 Jun 2025 14:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750687271; cv=none; b=guorgCvW+XtJvYyrv/wkFp49848dEYOGJgEYmn8w+KbL0q2/x0kTQb5PgmcMzzgyotOgFfJesGh4FVVYBsQp2U5oefespfxGQq5j0PrhY0HW5Nnakm57dPGEIxRNYrV80GchWMf2VZXZJzniX66/pqBHLnG0+FedxtkSGr6Of6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750687271; c=relaxed/simple;
	bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSIdstz/tHkMDAbHfxbfQEetvitA2dM9rX2oadC2CaykRVxuudsvKnqIMvb8dPoHCGlh0Kux4MAwYKMtH/WlU7SMZiOSO109Q3CCcp2mkI3RtUNXWF0galV6HjOOk8DSo7aFuV7DMYsPKLs0WTVdVfYLF6cYWmzl6ppWTX7Xb30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CVMOwqg3; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CVMOwqg3"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5535652f42cso4425743e87.2
        for <imx@lists.linux.dev>; Mon, 23 Jun 2025 07:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750687268; x=1751292068; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
        b=CVMOwqg3FZACV0fvNlGx1LvGkW6CfPjQa/zgV0OHicI2w5E6kyJxXdX2VF94tUuICM
         KehQCYkRgem1OFBYnp+C5YFTxASZFM0doRQ+LpSPcCj8TzyTWw7t38qdHWW/BllFQcBs
         EeqQ4yLyhtZf1JJ44ttl7Spl88GIlnkcn3IMq9RyFPlIe9DSNTvN3HIDP2D9Uj1VXtV/
         sZWw6sPW8TneqCDoNWzCA7+lkXNN9b2zEgA3kOOYiwuRkij/stV+JuKUwpO68NuPW9k4
         zt05oEw6AgHK9ekJNkt7mzNO52eo3yYfV2k3g28xWq4Q1IYxihC9aSK4F99x3/JSvuXS
         fH6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687268; x=1751292068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eio71w/pYJ//+HPI/HFvrWn6wFXbMzWKf+fC/EVlazI=;
        b=lsqzzSZ8pT+rCQ6jn5rcvvu2bAtSyCDMaRHxqM1TenEiUxDbTT88A4uMSXdmCCX82B
         oXlUJWNCDTeulSD8ybV5ThBSzVUoyVH/bDKbo38yEgDPpJxKczQUkb4Q4XZfEMFPBcN1
         Rz6lA9nDGOyQlRnnH+wb/GYm3OqPI7ReW0nl+oeQxAlSLsT13WzhcXWHCTKip3lpNpmV
         rfA1l103E2gZPbb83GgfA8eL4FAdwgs0OC3sS0aYcx6O08oQU+ZvRFrFKxZBmsXlzSJs
         FXIrd8sRZ3Q2lBr7keyidU7HyG8Yhh6xxNUd5sj7zfHDN1B34MKgoAkZ3WVFzq8AlL8S
         hwBA==
X-Forwarded-Encrypted: i=1; AJvYcCVMGKmEyqQkrQ1klQSpCCTGc0M8fEmD6Zp0KkoOuc8x4CEm74VBu6VQXyD7OvcDutwfpuA=@lists.linux.dev
X-Gm-Message-State: AOJu0YydVATq/jPUa3trAe2jugYhjKYf5ABSbOrLAnvVlo3oO6WtSXhb
	kl+pbK5/nt01ofQdMIUOKEM9jIpfCHnt+Kc+9MUwuHgL5ybRYLPmzf4wc6USc7r54N4TCJoX5Fm
	XhtrIv9DUw8LsHB0zScrEe9ZIz87Z7SY=
X-Gm-Gg: ASbGncvIeneg8Cc7xZADNYCc+rnIGEnklEO3P2jbDUATTeWEbEWAdkfbEa7sQh2kCZX
	HHO/jwobsu7zbKFGC6bQDrwAkINe0TAv//okshh/HqyHZk94d6ZzZoJ9XIZ/KLimM+D/YN1Qtgj
	DwBMBor7SF+SJgCkyui/IWwohSVaLhJrh9hUWvHcv8HFSSrQYEfqreaCzW6QjNHqVuW32/Jt7lj
	1U=
X-Google-Smtp-Source: AGHT+IGR9uZU02Z1imHj7MAxQiJrfcrFgQl4Iwi1qMx4X/39RI/yLTLvi2E9TpExz966iw2AnrUaGavuIu6muZwN6T8=
X-Received: by 2002:a05:6512:3ca6:b0:553:24f4:872a with SMTP id
 2adb3069b0e04-553e3bf9f18mr3657639e87.40.1750687266759; Mon, 23 Jun 2025
 07:01:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250620122353.150700-1-goran.radni@gmail.com>
 <20250620122353.150700-4-goran.radni@gmail.com> <aFVz48C3d+HHVHvv@lizhi-Precision-Tower-5810>
 <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
In-Reply-To: <00cf9c47-e101-4335-b918-f0b3a3c71de9@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 23 Jun 2025 11:00:55 -0300
X-Gm-Features: AX0GCFty6Y9honVX8KF-AR5BMA9uPsSpLblXjl7-3v4sjeMadYrJm6ZLkkE2tuQ
Message-ID: <CAOMZO5B39pBzWuXBoo5=eqQzZLxS3zBxCJw_GBYmABKT_cdQww@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
To: Goran Radenovic <goran.radni@gmail.com>
Cc: Frank Li <Frank.li@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 10:17=E2=80=AFAM Goran Radenovic <goran.radni@gmail=
.com> wrote:

> I was using git send-email, and I did not notice any problems with
> dry-run. I have 3 patches and a cover letter. All were marked correctly
> v3 0/3 - v3 3/3.
> Everything looks fine here:
> https://lore.kernel.org/all/20250620122353.150700-1-goran.radni@gmail.com=
/
> Or am I missing something completely?

I only received the patch 3/3 in my Inbox.

It seems you missed copying everyone on the three patches.
