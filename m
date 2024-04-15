Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B0F86630
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 17:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713202911; cv=none; b=hjxg1uxF8IuVulRS0ZL8syT6m/+gUrU4rOW3bsKYtDXrHU7tiQSvQu8t1XMGcBUl2Isj+QCcElvREusKCjFAuoAGS63Qy8Z5br3UTY9K+5b3WwfnQgfScUDWfObWNtwUUV4h7lde/RhA8b2zdcMgriuOBHsKypKP7c4jgLgTPo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713202911; c=relaxed/simple;
	bh=xDzP8JtH++TeG6a490HKNdr4gYMBp0MXFefRWtUa87E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ECMKbweR9ZUwyp59ANvZdib6s53Wq1AaTULGEYnaB2kj2D0wJF6dZ7yFZhKyUgZgYWmjs+OM5GxfvHKZZvadNWYtJm/XLSCwLsKUl548kgSba2k15YT2laZTZmoKjh/lrE1hBgWAVI7CjqW9HMV73WgfU7zz0WYEMy/PeqEHBdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xuf81BVt; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xuf81BVt"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-dc74435c428so3388236276.2
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713202908; x=1713807708; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=xuf81BVte/AysMC9ojZelae8IHA9Wd1ry5doH5XNMP7HIy2xpMwtejwA2TUWUL5eGM
         BwWj0KLD/rD7XvgHgawpQpyaPPDEogUUIS3EXOBw1xknUnIhJtQhVlzBFGJ5wrTKPvf6
         2VXEBqyM4HV6UsclV02g6Fz0LzQgiEUkZ8f/onYjRjZRO97RRcsohs//wBDCaNNIEFTS
         MomLz1FHbeermLpb/PIFYFBCM9Lhu6pnjx8/tJTp3ML9gFu0NPrtUriZQ4+RUFi4C7uh
         /YJhaJBTj+zYPv2Ezf0YTmzk5Hg0Pz2MsD6xgBxg+O+iYKQOV2GLUanDe6GXoLvObHxM
         Qv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713202908; x=1713807708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYgIyvMvRWICpRScbQV/k/jY5uYOgDdkXOWDfquSjCo=;
        b=VJ5hFcwy7iwL0SXRiqNoicXHwPVuW4IVhJJDaESg6QdnZFpOgwx0/UvyFkChAOSP3M
         blX+jH0z3nlhlAsGDYs0BfmCWXuGmSemC9Rx6oOLy6N4pwHQYnGJgeTBAcj9EIO5RebX
         KA97YzODj7zQEclHJ3OJ431ryDzAYQQJ5x4xcLhIE5+qhx6NcNYHa4tqEF4RL3tsKqqg
         elwkQ9k/ZC19wBfj4t8XspqsJ5V+8uTdRNj2L8YhSCL3j+11Nq+qPt6Kd0iWQ4GUgIze
         SxVcwDfWeeroMu/k1XTrFmugBHbYxizLecGAQMX3ZIutfr7L59LCEzJOxxsgVmZ1IleL
         BzaA==
X-Forwarded-Encrypted: i=1; AJvYcCUGwvmj1Jpe9fUR48zhJXwIspMS+j36Ofn2PW9CWmy48sZimJuegtMeIoUWjeRWftuXgyC5F1giSd6nx0GFuPutf7G5
X-Gm-Message-State: AOJu0YzDzpdqqESGULfIL1BGI2Zwt7FS3eMXIn/cdhGCj+TTQJ8i5+Ib
	7Zj04g9TH1UM7Wry7pUMh87K8ddNWb5yNqGkdzIq3Fz0hlLz8IQ051ckFURv4xZ/B7P6hTbBSOr
	19OpS1hvyCZMRq2T3ETq/W2+y9LnRrm9vNCXLZQ==
X-Google-Smtp-Source: AGHT+IHKpNfr2TaUgVv6Ugvchn9mUOD77xP6+GIEtmI5RLKRLLZLr1EmobTo6CX82MQ9pJIWGNHcl6abRXCvRtZsfeM=
X-Received: by 2002:a25:80c6:0:b0:dcb:aa26:50fe with SMTP id
 c6-20020a2580c6000000b00dcbaa2650femr10533953ybm.15.1713202908173; Mon, 15
 Apr 2024 10:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240412222857.3873079-1-robh@kernel.org> <Zh0vXinxy7woerJQ@hu-bjorande-lv.qualcomm.com>
 <CAA8EJpqL2T4bJZqtZ9KF=V2NLnFxUjouA6_Hu_H07DofifZaoQ@mail.gmail.com>
 <CAL_Jsq+q3OLEMT=d8=d9o1D9deKGQ5TAtZg_bgptDPQ1cWcctw@mail.gmail.com> <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
In-Reply-To: <CAL_JsqKSz_WVTTi7+AgjgDzXAnAqaxXM3i2NUv93nZSpyuZK5g@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 15 Apr 2024 20:41:36 +0300
Message-ID: <CAA8EJporYZBfDoN6m0Wu2wGqq=Y+TskNCguMOHtDAz05eXS6LA@mail.gmail.com>
Subject: Re: [PATCH] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Khuong Dinh <khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Robert Richter <rric@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "Paul J. Murphy" <paul.j.murphy@intel.com>, 
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Heiko Stuebner <heiko@sntech.de>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-fsd@tesla.com, 
	Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-realtek-soc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Apr 2024 at 20:15, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 15, 2024 at 12:05=E2=80=AFPM Rob Herring <robh@kernel.org> wr=
ote:
> >
> > On Mon, Apr 15, 2024 at 11:52=E2=80=AFAM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On Mon, 15 Apr 2024 at 16:46, Bjorn Andersson <quic_bjorande@quicinc.=
com> wrote:
> > > >
> > > > On Fri, Apr 12, 2024 at 05:28:51PM -0500, Rob Herring wrote:
> > > > [..]
> > > > >  arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdm630.dtsi                 | 2 +-
> > > > >  arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
> > > >
> > > > Acked-by: Bjorn Andersson <andersson@kernel.org>
> > >
> > > Note, we'd need to override PMU compatibles in sdm636.dtsi and
> > > sdm660.dtsi. Ideally it should come as the same patch.
> >
> > Uh, that's an A for reuse, but an F for readability... It's sdm632 as
> > well. Will drop sdm630.
>
> Actually, aren't those Kryo cores just Cortex-A53 derivatives? So the
> A53 PMU compatible is an improvement over the generic one still. We
> can't just add kryo260-pmu compatibles because that breaks
> compatibility. We could have a fallback, but then that introduces a
> pattern we don't want.

I think it is believed that Gold cores are A73-derivatives.

--=20
With best wishes
Dmitry
