Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E756814B09F
	for <imx@lists.linux.dev>; Fri, 10 May 2024 04:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715313779; cv=none; b=oaDmldl9HKU+XEY8qz4gOsLRX8+9302T5S5eXpsYF0kIbJ12I0giOIuXzbEo0fZXSCf5cd0sacVwjStSvyhdtIWnPGpSzxQkGYeEbk3T9vvJpzpWJlkiXEnB6+vOERanRRbDPOG/aC+3NnROiCVEha6mvvE6pesR8RfVfngf1MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715313779; c=relaxed/simple;
	bh=jvSmy0FOqXnRlpmANSVHSxZbSvwbfOidyhPqHt9kz0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Idvof31hdHbqg/FO+hhaKuMnVyALXdx+stBwgsdDmabFkS3CYwxjXwd6skPbbDHww+onBjpmmeum1F8VlN5HnOewrhwgQmq31abs0edilzOVmpR0WhaQAKUSZ17PXdDrMW3gmd2TH71N+NE1NMz8NMDit13iabQKRfF6AfDYP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gi3JrkYa; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gi3JrkYa"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-36c5eedd124so6777525ab.2
        for <imx@lists.linux.dev>; Thu, 09 May 2024 21:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715313770; x=1715918570; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OEJsQFf2xgBkjpapTfqeer4vWYgNIVVXGtaAWZEXf5Q=;
        b=gi3JrkYayIsHieFIt5VQjTGUVii6P1rwl4PIr+HJXzcDROJNugiUHQhxey7sbMPGSr
         xf0/FG7zkHRbzxBSnblrHGEQO0eV+RhkzFw+30ubniYmVWGUuh7AeBA3XJik38ApHT8V
         o2Z8tKZqLHQpyNLCy2KnnaquwSPHSWz8mPS1e1cvuYqHiYCQrLFqr38ZUxuIM4GU5DKj
         BcXvke9lbqc6abAwJA0KQncBaK/UQYihcydpTt5/W98zBq31cyvpWzvlpxPRfbXsY/qK
         /kdLXmeawLaV2MrovcVDPex9I/TorX99durpEe37YzaH8hdleyR4vWjXEFFMR/4i94Xo
         66XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715313770; x=1715918570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OEJsQFf2xgBkjpapTfqeer4vWYgNIVVXGtaAWZEXf5Q=;
        b=v4CDW0B4dhsALT8KvJxpHGJkJaTLPToHsT3pgU7BwAmzjc2++ewkHzcBGBCa84JD8B
         +srS6XAy+vR90Zqqm+Q85puAl6EwqUBbY9Cs22TN1p+FuV4cz/cmBXDCN8EXpFrBfXGH
         qxiBrmA8wU1ZlZrYHrkP4FUpmM2R9lrGKIXJEH0sxeG+a+ut2Hxtj67+bp1NZewd9EAH
         vmGZRpo8JPs1HkPnkUlC7+/OqeNS9b4QBi+arf/oi1dF4z8m+MTEYjWGNSy2RtGENgsQ
         5iFpYynUQg4UJOypg3592KtnzibkzvO6pt6a+1skO41MHWlMSVObH0QqyLAKnH1iWYyZ
         ZWHA==
X-Forwarded-Encrypted: i=1; AJvYcCVz1Kt9fhklULAT+IaqtsetaT2xTd15of+hmfLF/RA4DT/YrOAcusrwAzMgwU+tJCsl+ON4zDMLwom4NP7/VfTZYBJN
X-Gm-Message-State: AOJu0YychUEimY6J8PYG2LVJrOFvvtmq1gfETFMn9oa9FBiHR1GadX3B
	mq648XLSP4uy1Hp6vXlC/391AugcP4YoW41XxJHDwWgl8k23/yJC6NEGsQjMzdO7rQ9SwzHVnw0
	9jSQkxNJK02mYXy3rF2AckQGkgys=
X-Google-Smtp-Source: AGHT+IF/DRHYkgq9YNV2uNigtRq8cxq3EAkCVJLj/pteVRJ9Grp/Sf/n2cJ8GF/Gh2HUaqN1IhBXSRvg/7uJWGVE1Uc=
X-Received: by 2002:a05:6e02:1909:b0:36c:f0b:4f55 with SMTP id
 e9e14a558f8ab-36cc14f7bcdmr18846195ab.26.1715313770452; Thu, 09 May 2024
 21:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1715219038-32453-1-git-send-email-shengjiu.wang@nxp.com>
 <1715219038-32453-3-git-send-email-shengjiu.wang@nxp.com> <0d10a689504be61c50b186d89ddbf9d1.sboyd@kernel.org>
In-Reply-To: <0d10a689504be61c50b186d89ddbf9d1.sboyd@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 10 May 2024 12:02:39 +0800
Message-ID: <CAA+D8AP9uS1ePxSeSUPGCGe42U5sNguZYQS3d-9T305d2iVbhQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: imx: clk-audiomix: Add reset controller
To: Stephen Boyd <sboyd@kernel.org>, p.zabel@pengutronix.de
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, abelvesa@kernel.org, conor+dt@kernel.org, 
	festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de, 
	krzk+dt@kernel.org, marex@denx.de, mturquette@baylibre.com, peng.fan@nxp.com, 
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 6:04=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Shengjiu Wang (2024-05-08 18:43:56)
> > Audiomix block control can be a reset controller for
> > Enhanced Audio Return Channel (EARC), which is one of
> > modules in this audiomix subsystem.
> >
> > The EARC PHY software reset and EARC controller software
> > reset need to be supported.
>
> Can you move this to drivers/reset and use auxiliary device APIs to do
> that? The idea would be to have reset maintainers review reset code.

Thanks for your comments.

This is a minor reset control only for XCVR devices, two reset bits
are accessed.

If we move to an auxiliary device,  we need to define a new header file
and a new driver, which will bring more code size and complexity.

So is it necessary to separate it to another auxiliary driver/device?

And add Philipp Zabel in loop for review.

Best Regards
Shengjiu Wang
