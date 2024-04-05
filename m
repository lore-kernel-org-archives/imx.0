Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AF816F29F
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 15:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712329590; cv=none; b=DhmfYbJNrE7FTFeBOJBZRbXXZCYZm5H7TkyQgCLKDwa5SXQtHNX6hO7A4unNXXG7FBoHuwB1Gju0Y7wO5wd30YTtMRUuXQpRIynKpvrTrN6S+LzL9l2JroBguCoukYyN4KJvMo/SXLkwZTQvZL4Fqxv5VKlJO9mZ/UZjx/6pDYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712329590; c=relaxed/simple;
	bh=nDClXF3j4lc22O9XFA6Ptr+e7CswgCu/KhRNNcL/s2k=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RF2MewbJzX7d7B4uWFCa/JrJyBHsYLrKa2R1GTHVdibgkMEx03QFn6PcogXfxgQs5IuiTd5QbjhmZOuTl4CYSLOy7xkD3hKxPRoKVN9hM61gTOli+Zg8zj8qSnHUuhGuRTEo/1muas0S6RVCJoxeKKMNnT4crIW9ZKQ2odaTKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko5t+n5b; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko5t+n5b"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3416df43cabso1658279f8f.3
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712329587; x=1712934387; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cBcaVMbSMZkgJPIkV9Rq48dY7hxQJkftAGqxOYcj3jc=;
        b=Ko5t+n5b61YroVmc9lciRYJLLAdAP7OC66Qgxke1cfTuEy83KvEG9mGfYDzo16QnVd
         88CJEpj/r2F/oDRKBwY2LDC5fxZ9pSoJI//+UnZVkWoH60wj7xHcxni6X39N/oCHDhBM
         Dx9KKVyZmW0nnGeANtrMCYw3yC1DshEzSnbLI3neITRQFocBlEzVHRo8IBfbQ1qjC24c
         3OsEWdYe4OswTLPEGneD9Q6GSFSwYVTbaDxHcKzooZz3lkngLTD8weEqBs4p2UZBX0FN
         FDM8KSi+PLxoJu3fNHoRKmMx3n5csiYA6Qpi8gLCIAzPcBcwjdBrTFUTCVRyTw+Ahacw
         PXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712329587; x=1712934387;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBcaVMbSMZkgJPIkV9Rq48dY7hxQJkftAGqxOYcj3jc=;
        b=h3Rl65WkFcbgUKHLk3DOC3QcZKHI0QlF1Fd4WIbzpRbEDwYDitHapT0jKqjshlJhUs
         PW4Cf/fg0u599cXtPpkYOsUDiV6yji+x0J10RgBIaXVd93CgYIbbdVjI1z/x8oDZNkPl
         72WuyghVfOhux73Y/miKRLWxlG5xlcPO+Ds5rgJnpjLnE4pNmZpvln+id/CZSDM0SurY
         +9rPp/lTBwhiT3P7S4HpuEG0qEM+OwYurfPVvcv3cfEVNXr+vY5q2ZUFU6ZBsSNJE+pQ
         RlLAPdFmXuKJJXOo5dhfbcivOImcf5y4enII6HvU5NYnk/j53li6mQO5Js/D8+Y/Se2N
         eEVw==
X-Forwarded-Encrypted: i=1; AJvYcCW3v+/rlTMDgbgfmSo0pwNc8UigF2OqYkXZNqOwTLD+8Uwo0gHHVNt96in3dNRlYLj8ZGaJgiEXJtBwOcnHSEQ0AP8V
X-Gm-Message-State: AOJu0YzYnDbEuIblzA5fSdZZbOcqibVml7eJmD2MIMHWOKjSHVCcZy42
	OwIHMI7M9BwINaYPYxZgrfvXnPqLwO9IZd+Xi0nYiC5nG+XHaKIr
X-Google-Smtp-Source: AGHT+IGup9KuT3bGcXDYshgualkO8wp4iqLuiaYwB3pv/mfMPLTy4X+Az68C+QLsBtuAw65y5iqOgg==
X-Received: by 2002:adf:e510:0:b0:33e:8aba:cd0a with SMTP id j16-20020adfe510000000b0033e8abacd0amr1267736wrm.9.1712329586904;
        Fri, 05 Apr 2024 08:06:26 -0700 (PDT)
Received: from ?IPv6:2001:8a0:e622:f700:b890:c074:f63d:508d? ([2001:8a0:e622:f700:b890:c074:f63d:508d])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d5091000000b00341ba91c1f5sm2210015wrt.102.2024.04.05.08.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 08:06:26 -0700 (PDT)
Message-ID: <4e781d80fbec0db13555456ab8af6bdae6dee168.camel@gmail.com>
Subject: Re: iMX8M Mini suspend/resume hanging on imx8m_blk_ctrl_power_on()
From: vitor <ivitro@gmail.com>
To: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: vitor.soares@toradex.com, ulf.hansson@linaro.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	rafael@kernel.org, geert+renesas@glider.be, peng.fan@nxp.com, 
	linus.walleij@linaro.org, u.kleine-koenig@pengutronix.de, marex@denx.de
Date: Fri, 05 Apr 2024 16:06:25 +0100
In-Reply-To: <fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com>
References: <fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi,

On Thu, 2024-04-04 at 16:53 +0100, vitor wrote:
> Greetings,
>=20
> I'm trying to suspend/resume our Verdin iMX8M Mini with VPU IP using
> the latest 6.9.0-rc2 Kernel. While the system can suspend without
> issues, it hangs on the resume routine. After some investigation, I
> can
> see the Kernel hanging on imx8m_blk_ctrl_power_on()[1] while resuming
> the hantro-vpu power domain.
>=20
> Any hint about that?
>=20
> [1]
> https://elixir.bootlin.com/linux/v6.9-rc2/source/drivers/pmdomain/imx
> /imx8m-blk-ctrl.c#L101
>=20

Looking at other child nodes of the pgc node, pgc_vpu_[g1|g2|h1] seems
to be nested into pgc_vpumix.

After applying the following changes to imx8mm.dtsi, the suspend/resume
is working.


@@ -739,16 +739,19 @@ pgc_vpumix: power-domain@6 {
	pgc_vpu_g1: power-domain@7 {
		#power-domain-cells =3D <0>;
		reg =3D <IMX8MM_POWER_DOMAIN_VPUG1>;
+		power-domains =3D <&pgc_vpumix>;
	};

	pgc_vpu_g2: power-domain@8 {
		#power-domain-cells =3D <0>;
		reg =3D <IMX8MM_POWER_DOMAIN_VPUG2>;
+		power-domains =3D <&pgc_vpumix>;
	};

	pgc_vpu_h1: power-domain@9 {
		#power-domain-cells =3D <0>;
		reg =3D <IMX8MM_POWER_DOMAIN_VPUH1>;
+		power-domains =3D <&pgc_vpumix>;
	};


I will prepare the patch to send in the next couple of days.

Regards,
Vitor Soares
