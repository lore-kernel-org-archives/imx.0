Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859A7FC1B
	for <imx@lists.linux.dev>; Thu, 25 May 2023 14:53:32 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64f48625615so492727b3a.0
        for <imx@lists.linux.dev>; Thu, 25 May 2023 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685026412; x=1687618412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSEHc/E/IRDj7LOjfGuOCP5R0qApwuJ3GPnUYfvbYgQ=;
        b=UIhLvtHqXVc134PaX+UiIOlU0svDl8YBuorZVEi3vohqM50x1gz7LstoHNmII4zu0k
         Na1IT7g/EPDMh7VrYedF6AmEY+2Yq2rlifF6YevAlaEg3f4sOLn/KR2BXPqm1Z7RhNXY
         e+DeTVtT8d5sYCbstBdNtjwXUJrUvOv3NtmzqP7Snb/CXRNs/qOQXbMV8rDydn85E7tV
         L2xf4TsZpyXukvqM6r9w60aat0BbJ80IpGma29Zrwhfb+UL08NeJS63VSOhUA5OaTHZQ
         vftWcvYQzqgekttdaVfX9F+MfxaS4FBJ7W3Ok1KlALS9zhAkDnFtSs6v+lUTiEf/s2Oj
         TQbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685026412; x=1687618412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSEHc/E/IRDj7LOjfGuOCP5R0qApwuJ3GPnUYfvbYgQ=;
        b=GwcKYkNmOLHRLpN1NAzAceogInBUmkpYHr0uNuKOE6LMv7/Wx8SUROkk60j3mkGDS3
         k2/mK70yslcjJB75acT09u5SHb5F6VqVkbtD1T6qNKoRaLdRP0oSyJPzGqXUAELlTL/d
         O/X+IKu4WPQY5mdXmkeddcq26ivQr4cUJUiK8j72t2z2Lu8bn5kN7JSYVCeZdbG2XojU
         KHk3Z5QJ9esogU34yhPUqgTaTz6yu26POEnHVa2MQK0kL8mpRSybCX6b23bTqmYFwbl7
         wsXYf8MbHvgNk/kqAiL+RfoBbEdRanZ3dv79Cl9e2AR7YVzFro24QR6EWb9jdPCvDiTt
         /WVw==
X-Gm-Message-State: AC+VfDyDmuCVicHUaCWp6L+8V+gJ/FVpzdSaCbMGf6Cs/nkFxf/hQlN6
	Di7C3TGNp2MpKUaHjGJN2k4WkvgB6QaFX9BI93Q=
X-Google-Smtp-Source: ACHHUZ7kbUhHU9x1EyvAPA6NKg+vH/vYZmcJ12v0kydcr8EA6Xq1rxoRpRF4LOhzjmeQ9327UIPwr2rkSzUyrNTz7Xk=
X-Received: by 2002:a05:6a20:3d95:b0:105:66d3:854d with SMTP id
 s21-20020a056a203d9500b0010566d3854dmr18986356pzi.6.1685026411780; Thu, 25
 May 2023 07:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230524192042.133755-1-shenwei.wang@nxp.com>
In-Reply-To: <20230524192042.133755-1-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 25 May 2023 11:53:19 -0300
Message-ID: <CAOMZO5CAk+p+XN+g_kzxTcCoUT7uVa10U88Amo1L708i0uQVtA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8-ss-dma: assign default clock rate for lpuarts
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 4:20=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> This patch adds the assigned-clocks and assigned-clock-rates properties

Replace "This patch adds" with "Add".

> for the LPUARTx nodes. Without these properties, the default clock rate
> used would be 0, which can cause the UART ports to fail when open.

Fixes tag?
