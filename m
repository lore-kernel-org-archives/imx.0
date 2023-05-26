Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F8F742EE
	for <imx@lists.linux.dev>; Fri, 26 May 2023 15:41:35 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2562b1b1af0so161276a91.0
        for <imx@lists.linux.dev>; Fri, 26 May 2023 08:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685115695; x=1687707695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CVsVd/nLgofgRSk+/vAT2o3D23ukKuz0jIVgV0hlu0k=;
        b=BtWqzGskw15Yw56mToIyP0rZ/mXI5ByNChZLWrYiDQcOPJ8pHbHKxzNyBPmkBc2UT0
         Lz47Dt4bMSZWLo/4ey1DBbWQo5IevSbYqE//Aa8Vx4zmHHzhbYKJ3Y8brIKf2vgI53FI
         ++Jjtz54XUclO0gf8v9DhcAxX+BSe1JkxIv11a3alAbvDHW4H9//60Nb9jV0iJOco62i
         ubkQWi3Mzeg1zmsyk9Uen3NZuezj9zR4qY4Oy526C//g8WOBysCa9x2eaPCzj/b+fGrb
         Bu2tl9IZf9tRVbxmyB2SqzFbtUrpGnm/kf5qIwHsDfQ7lrYmwEtJIo1MM5zsDlqCpkmv
         0MpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685115695; x=1687707695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CVsVd/nLgofgRSk+/vAT2o3D23ukKuz0jIVgV0hlu0k=;
        b=UE0G6Pbq9SIJHhwpLoXBhNWdCkRvPIJ15AlpUe1M0Ub7sBTMpHVvPpwzXI1QZhKrYz
         LnmqJP2+Em5B4sbmPZcQYDoJLxprB3dx7YHs7E8qs1kSUQctcbT2O0UdB/EdKRvD3X3r
         5ANVKZXcJUY6Uoi4UcDfA6t2eSd9chXduofAyHTz+Qb8RjNYc4wVLDgbI6+oTtgb/2kZ
         1cbpDnlbj6HKU18MUN7kyUfzCpoTjiz3CF7j/Ae6i7v+3bC0u0G9vjYjWassd3s4FUpr
         ABv1wKscXj9JvIO4FgC7EM6kVPLMIS2wH70A70CoecnK/+4siPvBB89urMx3es5dEMlk
         eS5g==
X-Gm-Message-State: AC+VfDxbbK3GUbi2G8xlPusvEpeBUQSEdiiNRLn/XsjG0An+1faY49dP
	MlLtMmZx8MMjkBKnRlafWCqXS32TG5i5oqe49CQ=
X-Google-Smtp-Source: ACHHUZ7CiLGgfE+NHTMiaDWTPRKuMEXNSMZtK/RpjzsaKaN14ncPvumA/OqzM7/1FKDKGaGW5b+kdvrdS9/oVAYounM=
X-Received: by 2002:a17:90b:1e10:b0:252:fb6c:69bd with SMTP id
 pg16-20020a17090b1e1000b00252fb6c69bdmr3359347pjb.3.1685115695040; Fri, 26
 May 2023 08:41:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230526153854.469239-1-shenwei.wang@nxp.com>
In-Reply-To: <20230526153854.469239-1-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 26 May 2023 12:41:23 -0300
Message-ID: <CAOMZO5A=eCWG1D0DR4KA1zCfuXGnBBS5Z7YnL_vwH-3T2+VRaQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 26, 2023 at 12:39=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
>
> Add the assigned-clocks and assigned-clock-rates properties for the
> LPUARTx nodes. Without these properties, the default clock rate
> used would be 0, which can cause the UART ports to fail when open.
>
> Fixes: 35f4e9d7530f ("arm64: dts: imx8: split adma ss into dma and audio =
ss")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
