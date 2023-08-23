Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB71ED47
	for <imx@lists.linux.dev>; Wed, 23 Aug 2023 18:12:50 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-26fa19322b5so323053a91.0
        for <imx@lists.linux.dev>; Wed, 23 Aug 2023 11:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692814369; x=1693419169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nfi1MCjIHEtRlK5qwURcP28HIGYnPOfh0hAIrnuyXfs=;
        b=bw0Ib7Wvc3T8Jiw1TxIWLOXGEWigdrNUj+Hz6YzcrlTKkrK3yLz/GeZZkVa8tsF+9p
         pOJ4tkcJ9g5a+HU4xOKhAT3jq5ENubE7Y4PEiNP89o/cKTxdjO6sU3AGykOB6yp3y+3x
         Ope0Xn6VUoThLRJibm/zzh/ArlkhHT07L25JWfzmCm+FyqVqsO/Vq6p7GrFsX6gvIkqu
         bbKHFBl1LBjjEq3U02Hu0GMKklx1ut/SJ+qS7U4+KrYU2ds+XejZlAVaunahO7+iqhE0
         aj4VG0oZh5g4mY6wwb4iHUi/N/gORbDOSReKxzNFutkqAQ8pTEOlS/zxPw4zdMzWHIav
         RwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692814369; x=1693419169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nfi1MCjIHEtRlK5qwURcP28HIGYnPOfh0hAIrnuyXfs=;
        b=btTI+nInn/2Uh9PqdtsZX2SM3hs7OxWEES3I070+fJhF4FSEPv7SC+lNurX6w1nq3x
         cmnCZAh0kNAwTa/lXbVjL+tAm8eRWeKmaEGIZct7wD3uE4xQRszGzBSKGsH8ipBbEE28
         oUctLw/waoBS0qR766Z8iLqlM7RTtOoGprYHaYDVDmAtVeZy2m559aI8HnTjbQ0AbapR
         ChNkW/GIE3gvvNpBnSBqCvfIcNRq6DUSAmpZnBdsVp0Vz83TgWItnFfDp2Eq1QWP2RIz
         969dYmjQmx1L9UwAfnBU/VTImkCezPok1Rv03HbXFOH6AS9bmIW6ZR1sfQSmr4BQLxcp
         ZEKg==
X-Gm-Message-State: AOJu0YwzdbVLv8k0YuZzaPJTcYyorl29AZULewb0OwwyhpW0hdk00Zq5
	jrDGF7Y9IMeiff25qYl55NHdciP63jEIIzy2cro=
X-Google-Smtp-Source: AGHT+IFF6OhUZ8qx+TAuEvDeAWn7ceIKu3CsmvmhMsA1uaEzf9RUbmyJ5z0dSEIdDcW6jmU2KkQBF68KWTyCDe1AxX0=
X-Received: by 2002:a17:90a:9e2:b0:26d:1eff:619f with SMTP id
 89-20020a17090a09e200b0026d1eff619fmr11985687pjo.2.1692814369623; Wed, 23 Aug
 2023 11:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230823180055.2605191-1-Frank.Li@nxp.com> <20230823180055.2605191-3-Frank.Li@nxp.com>
In-Reply-To: <20230823180055.2605191-3-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 23 Aug 2023 15:12:37 -0300
Message-ID: <CAOMZO5BBLXyn7zpmb-DKNgJhY9DDP5_TgLZzPGREt-V_curvDw@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: dts: imx93: add dma support for lpuart[2..9]
To: Frank Li <Frank.Li@nxp.com>
Cc: clin@suse.com, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	eagle.zhou@nxp.com, imx@lists.linux.dev, joy.zou@nxp.com, 
	kernel@pengutronix.de, krzysztof.kozlowski+dt@linaro.org, leoyang.li@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	linux-kernel@vger.kernel.org, pierre.gondois@arm.com, robh+dt@kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, shenwei.wang@nxp.com, 
	sherry.sun@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Wed, Aug 23, 2023 at 3:01=E2=80=AFPM Frank Li <Frank.Li@nxp.com> wrote:
>
> Add dma support for lpuart[2..9]. The lpuart1 is debug console.

LPUART1 is the debug console on a particular board, but nothing prevents so=
meone
to design an imx93 board that has another LPUART port as the debug console.

I suggest enabling DMA for all ports. That's what we do with other i.MX dev=
ices.

By the way, the fsl_lpuart driver disables DMA for the console:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/dri=
vers/tty/serial/fsl_lpuart.c?h=3Dv6.5-rc7#n1696
