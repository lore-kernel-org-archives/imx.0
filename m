Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B030C49659
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 12:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765713895; cv=none; b=pkRKZ769A74vtvC45uiKBJlT1gG7XdBIJauWW1GiNnuax6h1I4hk7axikFKiYvL2Coyc1w3/edCyT0ZNS3EDxT7TZ8l+o3Wum7yuCtzvvqd2yO8aZyflSzAZL0U1pjdcqs4v9xvnoswc70XxJnRnxIIpuw7ggoPErcHz9zvuNWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765713895; c=relaxed/simple;
	bh=JxC1TTUXOv8h7Je59fO0E1QysMbuRT+b24AHjrR1b3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UDygJp7H6iQUxh5l+jF6gVKZltIJfIFBZ+NgB7panjWAvffHjvIvYRAK6s5x4dFSoskMoIBY+1sdU5i2ffGYjnSrClCfCpoEKRA8bFnVsZHA4Vgmu1XX3DZNKjqu7e1HXxqTHy6A/8yTrRsQljS0HYNqSJCXUkU5nrbTVgniPzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjcZAe5l; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjcZAe5l"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37fdb95971eso9726901fa.1
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 04:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765713892; x=1766318692; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6FVs1lq7FCYiXGgCHToT2WUTH1AKvFmKeDMOd7AaH8=;
        b=hjcZAe5lItP46mYT7s1pBraZkExJc7HcCNbG/pYMow5QFKOQfuCEZ2sObCA2BwW5Iz
         o94a09YJ7fmXF28mfNIRPRbmTzdrrnzEzbAYhKDBqHHChOAclOuY95kqZN+xSzGqKnuC
         VXXSxFiq3Rz6+go6LQuOY1TbG9mXVs/2GpdjJm1R01+CrTbqFAfmin2wpQDYni6+dILl
         hltOV1r/sD9TT5w0nAmVxJXUe40BUWdssjKHFmb2LZ+GIUEXdGj3kh62kLjrR430/RcE
         PF5gJ2mId9tZ3k2wDOMYcTgccNyTVG9oEUzRIsus+pBv6SgJHmsZL4gJZyRhGp8bMLL2
         OcWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765713892; x=1766318692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h6FVs1lq7FCYiXGgCHToT2WUTH1AKvFmKeDMOd7AaH8=;
        b=I8a9vv9ZpGhLaOJ+flacAY/P26CNroGcDLugQQ9VkzoneKgrPKJhAGUISR8pNT6Tks
         iS/VxsdnVieskHG2haAAmh6fKBhRxrb/ovlA52C0NNTFdnclYv4KjWEbDVJ9MKcXGtht
         4wdlAacQ8vo8es0euFq5xl52i4ehp1FYJqup95gh6XrLaWPZYaYGXZKBZwXiyx2Lmx8W
         jG/rcOMtV0qETpfSp44oNx+ljCvse4pqULw5mAMfOy4OEvqHaM0g1vamWsesJ0aEztg2
         O4sgtQ1Pb1XaZUMl5dvDE8WPPzRhL8jIRjI8/PNZh8WD2LmCcHWCAdzMycb76DoMHrJs
         zmng==
X-Forwarded-Encrypted: i=1; AJvYcCWbeUnCeTbUQW3g5JsLbAmPR37Nt/IDJEzEVuvUCoMZr5Xi0ztyAklRcdJjyFbrwRg1zwo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3ztwY8b8NPAevAd4W+xWhadvnNOGybnJLGp5kN4urmwcWORr3
	VF7mFsKG6N6ajB8JCHPOEgVNXTVlYsw77RLkWiRbrrUhA8XUIklS9C4yW2Sx/Vl/72Da0k5JPKH
	UYvK20N3NHD9dFrtzXeFg8WZEorI0sZo=
X-Gm-Gg: AY/fxX5sM80ifxI6vKeAB/KejemFYxK8wdbJsEuCdiCmZKcppSCQki/Ozx8HuZ+w0x3
	6BD67xggZzollqyyEGLu13irJdBer+Yj9CLgW6+UWTe7eF8h4xLzQyaoOsilIoM6bA/M/ecespN
	OXi5tPOXk90w8++/0zqYszxacWlTDX7gvqk4uil1HPZj9UPDgngxAEfyFqMnTiupF9zI+hB2k8U
	hpvlliVSoHolAlfd8o4ZgbkXJd/5l/V6wI8g5c0T0ceYyGBZCc57y0rxl0jql+KZXcw5YixFyky
	keaX1gHXnKYFuqAUwuLxk8KCwks=
X-Google-Smtp-Source: AGHT+IFEHj5vW/XmkFcEYVjxG+F3Nz7WaZtq+0llUfoVvXBqTv4i3OwZA6sGVcQV5jtiS+U2ieRUXKmtZhWxjytV7T4=
X-Received: by 2002:a05:651c:220b:b0:37f:a216:e455 with SMTP id
 38308e7fff4ca-37fd07ad69amr22302051fa.18.1765713891487; Sun, 14 Dec 2025
 04:04:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251214110531.9475-1-stefano.r@variscite.com> <20251214110531.9475-7-stefano.r@variscite.com>
In-Reply-To: <20251214110531.9475-7-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 14 Dec 2025 09:04:38 -0300
X-Gm-Features: AQt7F2p36DBHCZVA3WlHXwUgn4u6_L0tGkOCn88lhySCWth0zVlBdA_shlhyg2g
Message-ID: <CAOMZO5AzuZVkD3rTLEDGFpCx0ovtKfzjZtNgGG0uLDXbPkiqRg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp-var-som: Add support for
 ADS7846 touchscreen
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefano Radaelli <stefano.r@variscite.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Sun, Dec 14, 2025 at 8:05=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:

> +       /* Resistive touch controller */
> +       ads7846: touchscreen@0 {
> +               compatible =3D "ti,ads7846";

The public datasheet states that the touchscreen is a TSC2046:

https://variscite.com/wp-content/uploads/2024/05/VAR-SOM-MX8M-PLUS_V2_Datas=
heet.pdf

I understand they are both from the same family of touchscreen
controllers, but shouldn't you use the ti,tsc2046 compatible string
instead?
