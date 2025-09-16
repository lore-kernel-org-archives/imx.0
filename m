Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4405826058D
	for <imx@lists.linux.dev>; Tue, 16 Sep 2025 09:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758015738; cv=none; b=fMU+fcgFVpgxm+dKG39ckESEINiXFqvxacSnz8DlshQ67uj9oU/s67delYRWjRdhbHju+0xRABJT2CrhvWpHSoTwJJOoc4BRjacJJfiCX4Z2bMnknX8hn88PPbxPlYWQWUdo7yaLYkv9txe9Y3hXV5ENTe9y0w8tL3EVuFSmRaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758015738; c=relaxed/simple;
	bh=yxrxMt/N4dpi/T9k6sahK9m+SYHc4ch9rBILVIoKVxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rTUi0dwoaDymS4gRGk7aRMc3/qayr6hhkl7OthQNP/71MSGSHSPAyk8EpdPcK09eQztpfJqhjGrXsJRgweZ+DQDEXDkaYAzPN3DUHEswSQyhr/kUDC/0H3iwIZkU7Tn+SsI3iuwQYO7H4jk6EIQ3gEcVVJo/OmWBhQ3S9Rb4zkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6SOi7pY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6SOi7pY"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3515a0bca13so40934211fa.1
        for <imx@lists.linux.dev>; Tue, 16 Sep 2025 02:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758015735; x=1758620535; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxrxMt/N4dpi/T9k6sahK9m+SYHc4ch9rBILVIoKVxU=;
        b=F6SOi7pYG/SvcZI/daTr1Yz8yvfJvrnqJ9cOY4cmzIeSkAlePIhLubRQZbt8UqlyXH
         2fD0Aq+WYNEslLIqQGL7KcgndlF8lBoYXiq8WHJW/6PLfT+ZoWcnEI0EZNxycEP4N3Ox
         djXM4Ktz6q+oMsic8Ye1q5XEHOJqkK4NjO1PbTNKdGxB2f+OiEuQzHwz1YrvZZl2GDmb
         +qdSJ9hnFo49HINmLB2Di3YB3P4Tp9A4KaAu6lxAWO1mt8baaadjiu7ltaKQmK93zCqT
         knjxgqDLTHgyeeDJ4vnma72lpPtbO+H3qA0cGdLkhk6OwqLoDDKszQgoEV65i4i8BPTV
         KWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758015735; x=1758620535;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxrxMt/N4dpi/T9k6sahK9m+SYHc4ch9rBILVIoKVxU=;
        b=rgvGo98wwlS8TbU8EgcirvcsEKoy7U/+EMpRJ8qXh47aEnOGHn23qTs92cO1wCBcpZ
         CNEpKVvjcQwVotRHdVSR0xX9qs9nRcveUMD2kyQK36Rn8wIjSidtWaFPXYFaSAw0A2XB
         fribG6T1h+x3SmLK6VOtxwjvkEAQCySncw244AvMs3B/F0uZf0MchQIAE3a/bjJCkBp1
         QwbE6E05o+s0lX9NS7eLEyZbDbRLroCbqffIcQT6/iSrs3+S57VY4ZAkRtR3PPIzvnnI
         doBD8OXpLBdvjAqWahJMRtb/+SQsU8ZwpghEgxFqztdtHH1T888zDBLLTPugDOFPFtP5
         aPnw==
X-Forwarded-Encrypted: i=1; AJvYcCXmfNz0ChetZWv9ha1WUTD++OSojRXARCXBHBC1AEK7AGUbtwvEqazSRH19nbYJy3QIiGc=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiazvYheNlwzjYc9TGTNNiVUfr7TwIduQx/KII7FnAnhS84QNG
	yBUOUeMohlbwAvl6JmPDiT3FNQBQKYytVbI7ZfomM+4gKokMV9DmnGZpxdTrC7u0N6Utqa8uUN9
	MJWLNpYhglaO1WYNQLRwRS/yCSzd9BAI=
X-Gm-Gg: ASbGncvNNh5dmzYiCRReJ4marsMrm88/Lsh2yC0chToLNCruZVPLQ9CtGWv8wDqzA00
	BOKn0uApswsKw2DCWW554deN+q1+qVvUVCMeNmf+JAsSgPMUNUcjDPjZL798sxqdupeeMzL8Ry8
	dtyGlJ1avBi6Z/+O2PJUoEy7Ib20aMQ8k1dlQ9XCQ4hcwm/5RBM4lBb5ZrRBh/pS/2ycRY4xAHK
	9hmuEOPE6zVQzDkVXO3
X-Google-Smtp-Source: AGHT+IHSzD/UXtsWQJdvEcDe5zgMaGL6TzhZJBGJKbCYfBRewNgR6XMtJmfU671bOH5GYMzsf1oInRq2RbM4os8qMC4=
X-Received: by 2002:a05:651c:4393:20b0:354:4e91:5163 with SMTP id
 38308e7fff4ca-35cc1503303mr4719061fa.10.1758015735185; Tue, 16 Sep 2025
 02:42:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250916-flexspi-dts-v1-0-61567f969165@nxp.com> <20250916-flexspi-dts-v1-2-61567f969165@nxp.com>
In-Reply-To: <20250916-flexspi-dts-v1-2-61567f969165@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 16 Sep 2025 06:42:03 -0300
X-Gm-Features: AS18NWDVVl3vA9anWkY4oi_Wwrstjq0EwNsL75GDNd_C0krbxXIk6QAPlbESP7c
Message-ID: <CAOMZO5DYWenp7fzrthWUiEyOHAVcL02wBqvzA3RyPqiQ8CzGUw@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8mm/mn/mp: limit the max frequency of
 spi nor chip
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Haibo,

On Tue, Sep 16, 2025 at 5:57=E2=80=AFAM Haibo Chen <haibo.chen@nxp.com> wro=
te:
>
> The spi nor on imx8mm/mn/mp evk board works under SDR mode, and
> driver use FlexSPIn_MCR0[RXCLKSRC] =3D 0x0 for SDR mode.
> According to the datasheet, there is IO limitation on these chips,
> the max frequency of such case is 66MHz, so add the limatation here

Typo: limitation.

> to align with datasheet.
>
> Refer to 3.9.9 FlexSPI timing parameters on page 65.
> https://www.nxp.com/docs/en/data-sheet/IMX8MNCEC.pdf

Fixes tag?
