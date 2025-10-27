Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8AC32F9DA2
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761558711; cv=none; b=kHmbj/spK4cFdUW60EwVdBigsCPB6PbZ3pLVSPqbiPB3AEBQzoENsN9NRPpxJRny3ksUgq/A/dA5tZkFROrn29lJTB5Emmzhh5uojUF65pPNtwTwCg+Qqw7Lp0ACB5W7cFSmvWBFgkMBd5OjjhbjRt+TGcss1XaU2lOCDZka9b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761558711; c=relaxed/simple;
	bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dKSuid99bTUGgQ4QynV779YKASSkwGJwFRqKWgIiNeb+UWK223MYLmnTHYbM3NCgEiJOV5r3iER0d6sHxFnJ2kJOEOCS/rwVDcbJW/trkx9GRjj4Tyhr6F4B63/0zDopexbwxcCbpOsNoUshPuoMT129+UqfqcPGSUKJLKNS/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsQx1PQv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsQx1PQv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-28e7cd6dbc0so55951715ad.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761558709; x=1762163509; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
        b=QsQx1PQvN1LjVIC+/zLnbymsj58HqHqjv2XYjSog1YsHJx1SODfi/4CWHx1GGzsDAq
         EXVJfTYc4680Ow5XctZMI7GFay+wBcPsgWLJOzT411wqbGYLxTy3KUuAIBJ2OV1f0u+k
         uGKVFeNl5Py0Rs1zrAWDaabnEHIkcjI98yuiVMP4QIpSt9SzJzOYdQBnYpHHKHXka7q7
         GX4/4U+YbYR8rrycqBIqkpKc5OkjnrWqpveO54ifRGEBQKJIRZAGUqqWrp/MTPHB+g1U
         ps48KyTn+cPHqQ3Fq5jBIALo+ViX6dswtNeYalyhOhNLkxLQIkMYUmCLTaS8TheQ9XHK
         1nCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761558709; x=1762163509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIlMXVZM7u5N4GC7/QPTBmuvnR/eWVEU2XMt5zd3xvk=;
        b=gs2xE/lfnhXmA9iaUgTCDgZEmETz+LSgYevrHFXg/qvpG6zOeJeGHLXRvBHNZgdiOM
         jW4rCO2fvFG/w7P1xqQK49pTvo4abd5+VZga3IdwniUg+MWgPQe0KrrNWNaNdW5CSayy
         upZSU/5WDjVzvx+5cTOAoNa987ErrKCqEI2PZFNWvElETBklPaBBaPUOgjbz3OvhfgT1
         if1/Akn3XaHUdZj77mJXTdddcvv7RQIqCmHJuAaBPdY+Q0AgSrMqSr0qC49/rSCAu0N6
         +2QXcw4EQliwThnWwt9KlgTXjzmjjMQMPLN2EQNR1PK5RdPpH80FTOkIeNtypkuw8nAr
         UUEQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3JQaEzQ26fvHlXl4xb6RR/TtAmsQ5bL2l3JNnEsKxVrbr/LZPQhtLkmlU7kx4tOCiy8A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzP4M+mBBgxVbs5r1xRz6mcXpTrAT/fD9HOKvdeuPid7sizmrP7
	U7xMvpo1Ujt5fLDQduKddvXzxXYEMgw3FlBEHVC0PrNsxRnS5Q4sk86BxcdriVN1kyK+fLOVl4X
	dxAtoemRev0aRvAWTDZJxI421/DEjYOQ=
X-Gm-Gg: ASbGnctICUuvw/m62f449qwKr8gdtQVqaQ6QDaMi20r0pRvaYgWDMXZalI83BOj2lAo
	6AWDutuv177hMGvlXU/Y1IVaBVUtJKCUYG8TOmnAP5xV257TAiANCY8ZixMFHS45kKSezMsDIel
	749FKCwN6Z23xxeeY9lQNQgIPNCtpeYq86gqUeD3ICzSDxrsFMTBzLuSQv9oDYrXFGucJfQroKH
	cvYiAUqzZQC8WroV08pJHQU7pe6D7UUWqmYgMDkDicDZX/gMOLuB8EJOfKsdkhKjKO+LqVS+2P8
	/6eDUDPuQKMynBWLW2TLPol5
X-Google-Smtp-Source: AGHT+IFRzbIzqFV7pKBghEkL/y5mdil9BPJteZ22VTJLWtgkr233BhWTD9Jj/7BDpxsKVDDIAx7A2JjJcaX7rlq1vtg=
X-Received: by 2002:a17:903:2f82:b0:290:26fb:2b91 with SMTP id
 d9443c01a7336-2948b8366cbmr145344475ad.0.1761558708890; Mon, 27 Oct 2025
 02:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com> <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
In-Reply-To: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 27 Oct 2025 11:54:15 +0200
X-Gm-Features: AWmQ_blOtiRFVXUmTtN1O1lNjloemNSQ0tmWC3j2G4npOc3ifmBMtfeWO07HwwM
Message-ID: <CAEnQRZDFkQ80TGvpCDRZgVtKF9oUVoKQsaAtyhYHWHAZsg0fHQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 17, 2025 at 2:22=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
> "memory map", the definition of the EARC control register shows that the
> EARC controller software reset is controlled via bit 0, while the EARC PH=
Y
> software reset is controlled via bit 1.
>
> This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MAS=
K
> and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values woul=
d
> imply that the EARC controller software reset is controlled via bit 1 and
> the EARC PHY software reset is controlled via bit 2. Fix them.
>
> Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more r=
eset bits")
> Cc: stable@vger.kernel.org
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
