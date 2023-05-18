Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4D03FF4
	for <imx@lists.linux.dev>; Thu, 18 May 2023 14:04:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6439bf89cb7so364021b3a.0
        for <imx@lists.linux.dev>; Thu, 18 May 2023 07:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684418692; x=1687010692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bUUumQawtkUFqcWTcbwIurDkmC+nTk6fi3MmnvzL7ig=;
        b=lly/AFBayyLr1LH3KDVEKp0bpSPDxl53GslcKmV6mwQe+QX8LKpbLMovrXkt06MAFD
         QmZny7bzi8SNSTLCsrc1qhUyxF5uDltVhtIuXou76Csf8Sp5iOe1qRlZR4QT4UYv6XnN
         +td+r79W4wS0wblH2CfaJC/CH2oCQSh+rEMJbPOQKLwGFErDnLQB/kP/2wxIIVxMweRf
         taj3aSJIexJ8MtJqnP4TswnHX/VpMfLU8nMuZxKAdzoV34v2n91mw6y6z9H08U/1zZEW
         VNmnvQI6b/FbZWycTB8S+gMLgva8OQELynUYpdg55PKQSmYuAlZTunU7mup1fHYJ5VLE
         fViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684418692; x=1687010692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bUUumQawtkUFqcWTcbwIurDkmC+nTk6fi3MmnvzL7ig=;
        b=kdtkuc3LHnRZWhmbdPO25VC/Tp3yocqWABa7RyEXqQAAyf4NxWHWeJOiZbsq20KiKg
         LFrcxfNUkrWT+NXHJYyg4i2AIgfR4y8y9W4+IfXzjx88G363u48a+Umg3wi1OBnsQuCC
         GKmQbIWS/WaJgvtSnVNanzZ3ivvneKlQEiHHyRJHj5sbP6h/q6FtW/U8akN6qxisKyXR
         G9aNIWTK6gVUs+oCCQvGUD0oyFeX7dUbZYmOaFV+xkNKcCnAQRVsvPm8xDmHqlESNTwD
         3CSjXLCqZ6GpwEdIklEHKbt2kA6F087Kxo/BZDWZM+H3syHPA1QjQf+NBKKgXHqFLb9J
         EV0A==
X-Gm-Message-State: AC+VfDyQST0iLV1z6gtfTDMau+KppcfPs/+5aeT/eU+JP4BnKnHV6oAn
	04RkeW36RGtv0tzvHu5kXlkB1jjcR5Dt8/MhhzM=
X-Google-Smtp-Source: ACHHUZ4Qk7E4HCnIbMYWhcYXpx3iMrPUhef6l1S3CsWdmOOyMSUMMZGrxJR55xkwxiST1QuY34wHCG/oFP57giNIV4c=
X-Received: by 2002:a05:6a20:6a26:b0:101:37b2:62eb with SMTP id
 p38-20020a056a206a2600b0010137b262ebmr8075272pzk.5.1684418692399; Thu, 18 May
 2023 07:04:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230518135421.1905616-1-shenwei.wang@nxp.com>
In-Reply-To: <20230518135421.1905616-1-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 18 May 2023 11:04:41 -0300
Message-ID: <CAOMZO5B9=kvFnuW7aMFSCMgF-xmuf0i3Rbzo56SJWpvJuri13Q@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: imx8qm-mek: correct GPIOs for USDHC2 CD
 and WP signals
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:54=E2=80=AFAM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
>
> The USDHC2 CD and WP sginal should be on LSIO_GPIO5.
>
> Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
