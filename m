Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025B33F23BF
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769083452; cv=pass; b=r59UBy+3NL8covpqpuk55UJ1jA+Q4qGZHdaKBz/5XN1Ppr8EMllpzHPWDWDXWCq9W6LrOxpdPEX5sI/iWt+ImmY1QfTmDEGAMUb11i1OjGNJfD2onIeIU3JCM4x2JbmQgHBhwj8K8SQsCRiD6C9g7vcWGPR/h9lpE7KwsY3A4dY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769083452; c=relaxed/simple;
	bh=X3hWCPtAHf66rCoHEjgzZZXz3d7jr9a0ZdE4RDvb9rA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GslQBGaN+QiYILe1mEs17EjYcj5aiP03iz0PT20cN6bHzmobKqjgtFVkL5cHHp55OF7s0fIyqEVlQJSck/r4JFaiuyRan4SvQWuS5yzI1rzEsbeAlWwwvlg1C5xJVgPCPcqIAv8BmoLw5i63eglNx9yJQarUkM5uWjHOYouE/ns=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iPTFVFEe; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iPTFVFEe"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1233c155a42so1251516c88.1
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 04:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769083449; cv=none;
        d=google.com; s=arc-20240605;
        b=go7gOipu5HNZwMr8cdvcjoVaS+rvynfghrttgSxzEFnqLuHm9EDhuwaAgaVhHky3Sc
         8mVVulIms4GgQYX5909hkSsEa+kImDjZnH0MCU49Lzk0Ngk8aLFDJUHBKCoXx9C+hn5P
         eq6FYmSvhRk4CDO8NU+q35sPqiEGMGeUSp2bRHNelIJMPziCBDImuw0cee47rdeg+Vp8
         Dr/3nZl9kpxr+n0NVqc0tvZM1F/PJEQInRBCgpjuYqFGMtLgx9IwNJeLVnszAQB5jUPO
         EoYqOdNDRgyySyeNIBWA2Iy0cvAMRglmaRMMVHuVEU1BosZ+/sezifNKwk+J6cF8P2Du
         jX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        fh=c+B5rN1xLeIRp9vHyrZ+2D6kAVHzx7RrdJDh0G7Nfnw=;
        b=OcwUOT+z1y9BM9ZB3zj+8lYkMdAfJdhYgTGR1cUxn7wVGiE2CjNqP2DzcdXXFYrI4L
         3Ed0VYPPC2eVRRwU7ML9AQubxAqrk6qbs90tb9JxP+kio4Fij6L2iiKmY91FMxTmunge
         DHRPd05ZOoXv+5NPEekILXFnvSNtwwj+w7E68dYn939FwR8wHlYW8HRry9WBZN9TRoz1
         w/Bw8NtKQwtHzpClFjeXN/b6TgcVS1nbXtAeceF2z2GtTBY9sLKqr/bostMiDafeksbM
         QxqJDPcMziQSI2rcQu3hVfNuxyTgnRBIt4idQ3CFbX2LWpHhMy0m5o6OSrNTEPwZFLyD
         n5BA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769083449; x=1769688249; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        b=iPTFVFEeEsd/1Us/Os093g3L22zEl4F4at1EQTuFOc4aE3yiQfXvNSvjPqRjtp58dt
         tzNrNqOT/aN6lDyLjtqE/5E+sG3DRDOXDWnt3zrdxee6TKj3TNf84xe0m49TY1Ev97PK
         S5xSctE/NmB3OeiReCktSlLZBj2hFyX0fWjblZTKG3vATqgfgchXnweg7X3Q4o82r8jr
         xmTCVlxs6sGn4NNXsupUUSRv7FEnRaBStpEEYcU6LM9OMY4VIOO2q7hk1oECeYK6EgqU
         7lMAGOxqNnsvqhHU+P1eMuKeG93ayoci9ku8j9bctZ/78jCQjspWV6AL4xeeg5l1sgMY
         RRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769083449; x=1769688249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZNBdB7Lhd+f+BWkI5lcufgpivjRwqjcdh4wM3ExInI4=;
        b=jaYpVHSv8jBzBvkb12veYc/z3IzdniTFzJGJq778vdpIaVIUfjO8wadVnWuayQEvq5
         q+mvHTbneGgzF8UQ5F7U4w3ikcUwefMClOtrXwmkhnyswBifvCugPNk4k985sQaxLu0R
         4TIJPlCwuNJuZt9EuY3mbmKnf48dPLpqZhk7wB0N4wC03e+k18mfTGpsEhVUeVwbXSoW
         ayRS9R+n7WkdXzoaH2Kqqwpo9G1aTpYesB6HgGbfW65UvRZ/6aSr/Gwe4XTPEGT/hoTM
         fE3XE6o1j+WKKU/osi9wbCUIEdS2aNIpGNfTINzppumRM3YkNTgPUefgcVycFVcGhZA0
         0yDA==
X-Forwarded-Encrypted: i=1; AJvYcCXogWPf8V6xA18UuZbUeInWaWMZ/aMEHziQV7lvoq3tRmZbiVfz0Udg/jOMB0dbtRENKs8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwtoEIwAHp8hOc9htftyEF6c0UqghP7Nm8cM9KHlRFZjv7sm5R2
	rUmm58DDGrghLrBuefDL8apXA/4XJJNag6mmoCAQrKRXv4ex0budxbFg+KREdtrlPcQmO3Y54tN
	4jPIJHbCNrfRVvpUZjOq9lBgTrthTXP4=
X-Gm-Gg: AZuq6aLecBNRF4ZcTcRd2FljDlscwH6AY7Ki6ndHulzYkNZqWIoSug/7vJ4JxuUTUCP
	t8D5tM+JygQYIxzu92hSmE3USs1zQtREkmHmtRXqbZJVeuLEGMf2vEK2T/xmrrgiVKVJS0nq7WJ
	JXmtAgmIA7xduCbNj6Nl2TJwRB5QcpHjwppiVfN9lt69kssvPkHdw39ASbq74IF0DsUCYqG9cky
	mdhA7F01t4ChOtfbSkgnAL+YKz9iQN+E8DRorsjYcoIhxRNJb7cOSYQCTlfeuRQ6Vqq5MdypYdV
	e0AGVB9ZVi/LGfFLicdS/L4n17CNooiq8S8Pia0k7vCwLZ9wascIp4+bmR1Q0nfYSCN0q/c0R0u
	oh7A272DxjNZtlA==
X-Received: by 2002:a05:7022:6986:b0:11b:b3a1:713c with SMTP id
 a92af1059eb24-1246a958283mr5461620c88.9.1769083448808; Thu, 22 Jan 2026
 04:04:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260121-ccm_dts-v3-0-820ce9b5fa38@nxp.com> <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
In-Reply-To: <20260121-ccm_dts-v3-3-820ce9b5fa38@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 22 Jan 2026 14:06:47 +0200
X-Gm-Features: AZwV_QjimaKd_p8jdtYQifLmLFybP2fWAwRE2czS_YKMQ7pErfdW-RzqTfHjkKk
Message-ID: <CAEnQRZCR3oNgfuknUnm88P2Cc4=CYc+MEd-hPtdceRhGhNR-ag@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: imx: add required clocks and clock-names
 for ccm
To: Frank Li <Frank.Li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 8:22=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add required clocks and clock-names for ccm to fix below CHECK_DTBS
> warnings:
>   arch/arm/boot/dts/nxp/imx/imx6dl-alti6p.dtb: clock-controller@20c4000 (=
fsl,imx6q-ccm): clock-names:0: 'osc' was expected
>         from schema $id: http://devicetree.org/schemas/clock/imx6q-clock.=
yaml#
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
