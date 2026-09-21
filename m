Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD6CD3905F8
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974360; cv=none; b=AQ9+/17E/IOZFA2+3MPi+KPI5NukGEmZ2SAC6sLV6edcMJ3mkdHXxgeSL8r4jiCvXzYFsOtaPpUSczxf3QlAVvK85H4jXvSeF6cmZN7Uv1xtjiRx9JhrwxUho3YJTf0DzsgdlgLFiL3FLJgRzvwo5u+KFKWpI5l4rpg3Ci/6YC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974360; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=svchXI/iMj04tsIAVUqmHVw7ydbmva8vB2jO6UE4kGKjSRWBZhurO6UmT1G57z0DeXW0VS4Mi5gUCbCSImT2CJSeeTCNZ+PoHjEJpMglp+tIYEQgt6ilv8VpP2BuGL55kbe716uVOAqdcvC/JmLEmFEH/CXUOFh6BUg1Fv2EB40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso1890385e0c.3
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 00:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974356; x=1790579156;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=In4dR61xSojs9I8oToqkWc/rgOC3R1tpZnnCvOVXB+JF6SFHLYMoMAOHyBk4lIbXZX
         8xX4n22cDK/20zcaJi0T7AtJTyKPrXK1P2T47h/uWjOkNkNmeaTjaThkoPPTb5O2rPuI
         OTj0CJ+T/uEI2vE1IMxo6roIsz+zKIVfsDBsClRJfEkCiD5iUomZoV1lP1vrzjBiS+BG
         s2www6mHfaHm9P7pPvh9xkYEJ5rUnrPBJY4aJif7fiAiquxGdqvWRmZYeWhJH/jLoftf
         twTZeC+FD2d2T1PkV6voMjeTSIVC/xiyN2MIIiSiGT4n8Qd9rX/Z/sLLiHK8u1llp2jH
         4erQ==
X-Forwarded-Encrypted: i=1; AKwUvBxMO1fukz+CQpRXftemvUShhhlFUOywVkNEdgKjDuObd/PmUKZXu77Jdv4lpYUq1fEKT1E=@lists.linux.dev
X-Gm-Message-State: AFuF++nn7kMu3Al9EL7oYkLjg/kUDWG4njrrC1utQUjkYF2l0o6NeNRc
	yNDWFfKIets8UvM91x7dn7Hb10cB1SQVGnR84/b30tBwcQICEAqq34iaUiDSobN8
X-Gm-Gg: AYBFou24MlMFD+GWIxpLY4WfWLEZ+hLFDv0FZtYiWdCDA+fi9Ajq9ieSPPKznzEK9oU
	SuO4Sm7t1Ut3s5UMVrb2eswvxyxOuRUf2HjBox2ofcZm/fl6X4ZRmn4gOd0Cyk+798ITc68HBh9
	MFihUTqjY7pspYjhIr+KiDP+ssAe75tSKrWTMlKL+5lalPOQ7GbXTblsDa5dAKeYDqdIeFWAa9j
	b3uergBHnfgy/xIAiE0KfS2phRYUkVybqReiOAib+2QECYgytUA+F03pVGHTAzIu/8557WwcG3t
	pSGmslyLWFVfL48U5tIWZWKoQZ5+bzs1H27eg26ZYFhlW2PLDTW8bUJMqLvFGimcfn5+N0OzmY/
	Sod8Yq1olCbcI2+jlnSh7Wh1ZQLsV2rWdiRAq2Ep8Rb8P94iSUF5PFEujPaCckMjvGwQFhwZd8j
	Cb9AJQ+Fs2TnmuLB70xZmJoSmoPl4H7KK+v6S0irB+zcvuTlpAe5hWs8Fz4u1hBgxblhuiF//qj
	vsbVYGnbnIqgBnvF4sLSCx27D3nJ9S2w7uv
X-Received: by 2002:a05:6122:390f:b0:5c9:a60b:e5a9 with SMTP id 71dfb90a1353d-5c9b5977db0mr4405058e0c.11.1789974356305;
        Mon, 21 Sep 2026 00:05:56 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9c17a96c3sm6266965e0c.1.2026.09.21.00.05.54
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:05:54 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-79189dbfb32so518529137.1
        for <imx@lists.linux.dev>; Mon, 21 Sep 2026 00:05:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBi8qwE4nWsu65Zprj3E36UQu5VRUnFGvCOoP0YYYrC4ZDRrCpcXkNThYEDPyLyonwaGA=@lists.linux.dev
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
