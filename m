Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795172758;
	b=SPEjB3Qq5/8Ky4sTSCxEpfjlmjFBiHsV8RP232N7lKdMqUSBC6LGZHxHdV8DtQ6J/np2
	 NuspqhzpyxoPTOR888NporLiJnNQkQFQIguHf/ACky1f8jF6PeY56X9IAQRT1gEEKFOwf
	 NIp5xlX7x3ecsjQOZif5S7F1pJyzJfp7/KzysZc2hpWKt2byln/eEl+isfd6iUNQ+BTtf
	 Dj5sBzD0/H41nCBafyEy+yPc3aQ5R2QxGeACS5vV6wH8eXvFlnFwHIlGaVv2RH32fYbEP
	 MnUqX1W7YoKZVPxrv2ojR+SvNGc4EnVCf0W4ajLeqopyqnrDlL/5W47DvKjtWAPIVnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795172758;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
	b=wyCSw/MmxjfxmjxQsPFSa9AtNOquHJKdDtS5u76YEgmVGDce7L6jRoyLJwmT/AvZY64v
	 mYAI0doNBLbyI8/iUYqG4oILXksUvDWJiFBxJMutzYiMVjFl1zPqiupkQAfH5s4Ip0PkO
	 l6dObsaxTjMM/IZJZUL/XAy9tdmb6Jq5yzBPE2yFP3leUrHNQW0eUOLxWWbsrT8BoG0xJ
	 YgJO0UFlP6H4AgZGJ43t9r1J66B7NZXygeIRx29Y6/mJJcy1W/mpOv7xM6YVbB19gUSej
	 R5+f7OwDxzB1XA0kWisi8skGWN2CN5rsVTGMGKDPvApAsuMLed7krlohbznsWrpN82A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZraxnYJb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A81606A339
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 11:05:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A81606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ZraxnYJb
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso6532007b3.2
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 03:05:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795172756; cv=none;
        d=google.com; s=arc-20260327;
        b=qpYOJfIKktvbXCSnN9m6TLmopje6VkyNKDZaDmyr7cL67URdPqZ2gjLMHTpc4chM3/
         C/xOcL2YRF3sedxazIae0+6OpYh/vgjVrmX8gyOxoZfoVUfQ/kmHhC9Uow0ucB0mdoNi
         GfcKsNrV1e/SFjvd2ttmJQILGTJ4I+LABgUGkrAsSxFekL402oA22RKAuc02lhstXGEw
         UhJscsuI6qPbDtqOdu80iR+NxMqaV1YUSH/TcAtpMAKld7xD5kfVSGrFZz3XT+XyOI9F
         kd8ZUYjyUEthS65wi+QFPLOzSuf4ymUaqhUslUHI4zzMUP9NBnLHqwwZNTaY1PN4kE5A
         gyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
        fh=OPAGc+VZ6VQDmSMMz/AXs+0ARGHYp1icwoDHsGkk5R0=;
        b=rROoZRx04Nmp1as4DQoiumYHTtCBdszcv3FQxuN9pHQOCxac+Rxg3ZLFD6Lsy7sTrG
         pZu6AId06LjmL8zyOP6hlWlsoJu1BhgISJzlTC01iHAqXxmCwYRpABRTYribVWR/I1Zy
         hEvgzJPd6vyulil5gS7wVRtvnNpFt95woCTfMNPsZzcQWgbfR78FQ7thlawFqdMhuudp
         s8vDQt9iuuuCNE4Sk+a8u5/jBxUQ+bu+lYQSTf4VprXHnRIOVKU5SnoIde/fqq6RTOLm
         nS/2dKmj0oOdhJc2ImwErQ2bS+r3Aibs7jkqHASVB9n+U86YkInngh0TnKXk09F3XK3o
         bWmg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795172756; x=1795777556; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
        b=ZraxnYJb1wgfLGJJE2HTdfRip+K2Oc9OTv8RGao7B0VruGP6uuZSBQFnWIlibiYJjw
         r4ZSNigglf004Zs3puqvdFCEilg+jv8zeoCjW/hoeNzE+RBoAsPWwNy87ydR7icgXhYN
         7vtpzOp0HOTm3zjfNLuK0ecRPsc+zIdpESBQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795172756; x=1795777556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t5AKTHXlCqIuWDfB5gbPvSysRhBo74t8qpIPPyXGwtU=;
        b=MRF50x9wBqVLGh/760YYreU4AJdVCeuCS/74nfXM+ZXmMrty4eHhKITXZqvMdMHmsd
         P43RAaxTMBTEWPLPc62tSko3O09hwMG9lxa6b/T/IqCDlYqp8MqWItbRBWW0WUeWWv+1
         VUMjDE/1wGqlqtTXSKQbXkQKKKVMlmbIow5dBwKDAi0D1CrysQeC/ZWzp4HPmx2oCGV4
         eQ+HWbOE9d6RWO0BIt/SqTB9LQEL1pT936gUXn6A/WDxvA/65oeDDBdBTw/PBtnwfuoq
         cLT3/iC4LcwH/UcAY9n2NC0o1mq+yJd4iKd02i1bKwHeLgRrUB5ymXUWGT9HDnmIauJr
         t2XQ==
X-Gm-Message-State: APuU4Z8SIemI/tXLcG1axk+zr6G/28Z8KfdEzRS8irOkiFfi+LfucBIF
	z5hSG+AakV90ObLvQEKNNH5BZ0IWW9rqP2g3Y0H0iguPB+7SEMpN+zPVVPnb+BfHEKpqVSDkgu7
	AzMaGwoxbDcQWUw7/np6UaP6o1lZCAIs/KOKkPV2AGQ==
X-Gm-Gg: AZFdTZcgSR0oKWh+bcv1hsBXmEhGW5hCGhyiRm+xHDz92uMlw8M6OLKIXx9ocDky063
	sp3muhR8SctqSeQvFlfAz1mnL0y+FZf49M4w6Jj0OKIC3xopZDHYM4vmRqaZhHoTSnMjRVb7ybZ
	Ubf86hmvcjAunKVHFS7ijS7Lgz9okjYJ+iIu6oUN7P2NGgFM+bMOx/J113zGKVI9XDl3mpNmdhp
	BI25wZn8BfleZ7KuYEqtUfNvyNO06mIvYSlUwWIorwE/dKb2N+lai4kW+jmUFFQeuzwQ5AxbDmd
	O+7xRlJZsterKpkRCykapQ0ETbBMQrBTK47pCwQmiLG/FfMFEQnNQX74fDvfI5FR84/NLjaUchb
	ePEkUR8qFWRLXEjfgTMLVV3Y2xLH+ERWPZbDCAEJjbckKXb1W6IogudGmnnUjBlFjzP1VdfIABD
	N3hJwXzmNlN2Xg
X-Received: by 2002:a05:690c:6b81:b0:8b4:d0a3:dd64 with SMTP id
 00721157ae682-8b520456d74mr12517987b3.12.1795172756538; Fri, 20 Nov 2026
 03:05:56 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 20 Nov 2026 12:05:44 +0100
X-Gm-Features: AclHuK8j5lV0ZPwyCvHflp982Xer6I8gVMC44Ov4SpRq9SvLhJ8sxGrzvqdlJNI
Message-ID: <CABGWkvp-fBTjTZKxkUTiTFzUYn70x1OTQxe81Jh=ScPEye94TA@mail.gmail.com>
Subject: Re: [PATCH v15 0/2] clk: scmi: fix the i.MX OEM spread spectrum configuration
To: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Brian Masney <bmasney+clk@redhat.com>
Cc: imx@lists.linux.dev, Peng Fan <peng.fan@nxp.com>, 
	linux-amarula@amarulasolutions.com, arm-scmi@vger.kernel.org, 
	michael@amarulasolutions.com, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Sebin Francis <sebin.francis@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Cristian has reviewed both patches [1][2]. Is that enough on the SCMI
side for you to pick them up, or would you rather wait for Sudeep?

Patch 1/2 is a fix for 7.3 (Cc: stable), so it could go in as a 7.4-rc fix.

Cristian, your reply to 2/2 [2] has a "From:" line where I think you
meant Reviewed-by. Could you confirm?

[1] https://lore.kernel.org/all/avMog5kzJpsiUhXn@pluto/
[2] https://lore.kernel.org/all/avMtgxmGXTbTKG1t@pluto/

Thanks and regards,
Dario

On Wed, Nov 4, 2026 at 11:36=E2=80=AFAM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> These are the two patches of the v14 series [1] still pending, as
> patches 2/4 and 4/4 have been merged in 7.4-rc1.
>
> The first one is a fix for 7.3: the i.MX SCMI OEM extension converts
> the spread to the wrong unit, so the hardware is programmed with no
> spread at all for any valid configuration. The second one rejects the
> configurations that do not fit in the OEM fields, instead of silently
> truncating them.
>
> Brian is waiting for an ack from the SCMI side on both patches.
> Sudeep and the arm-scmi list were not Cc'ed on v14, as
> get_maintainer.pl does not list them for clk-scmi-oem.c.
>
> [1] https://lore.kernel.org/all/20260904101243.412006-1-dario.binacchi@am=
arulasolutions.com/
>
> Changes in v15:
>  - Drop patches 2/4 and 4/4, merged in 7.4-rc1.
>  - Rebase on v7.4-rc1.
>
> Changes in v14:
>  - Move the fixes first, so that they can be picked up separately from
>    the new patches.
>
> Changes in v13:
>  - Add patch "clk: scmi: reject SSC configuration out of the OEM field
>    range".
>  - Rename patch "clk: scmi: fix SSC permyriad conversion" to "clk: scmi:
>    fix SSC spread conversion".
>
> Changes in v12:
>  - Add patch "clk: scmi: fix SSC permyriad conversion" to fix the
>    permyriad to percent conversion in clk-scmi-oem.c, reported by
>    Sashiko AI review.
>
> Changes in v11:
>  - Add patch "clk: Validate spread spectrum configuration" to reject
>    invalid parameters in the clk core before they reach the providers.
>
> Changes in v10:
> - Drop patches 1-22, superseded by the generic spread spectrum clocking
>   support from Peng Fan, merged in 7.3, so the i.MX8M specific infrastruc=
ture
>   is no longer needed. This patch is now based on the following commits:
>   - ae794aa6e88d ("dt-bindings: clock: Add spread spectrum definition")
>   - c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
>   - a7f16660af39 ("clk: conf: Support assigned-clock-sscs")
>   - 7d98de6ffdab ("clk: Add KUnit tests for assigned-clock-sscs")
>   https://lore.kernel.org/all/20260826165611.236321-1-sboyd@kernel.org/
>
> Changes in v9:
> - Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
> - Fix building warning raised by the kernel test robot for patch
>   v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
> - Add patches for imx8m{m,p} platforms:
>   - 23/23 clk: imx8mm: support spread spectrum clock generation
>   - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
>   - 21/23 clk: imx8mp: support spread spectrum clock generation
>   - 20/23 clk: imx8mp: rename ccm_base to base
>   - 19/23 clk: imx: add support for i.MX8MP anatop clock driver
>
> Changes in v8:
> - Drop the patches added in version 7:
>   - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
>   - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
>   - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
>   - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
>   - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM
>
> Changes in v7:
> - Add and manage fsl,anatop property as phandle to the anatop node with
>   the new patches:
>   - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
>   - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
>   - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
>   - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
>   - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM
>
> Changes in v6:
> - Merge patches:
>   10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
>   11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
>   12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
>   to
>   05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
>   now renamed
>   05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
> - Split the patch
>   15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
>   into
>   12/18 dt-bindings: clock: imx8m-clock: add PLLs
>   16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
>
> Changes in v5:
> - Fix compilation errors.
> - Separate driver code from dt-bindings
>
> Changes in v4:
> - Add dt-bindings for anatop
> - Add anatop driver
> - Drop fsl,ssc-clocks from spread spectrum dt-bindings
>
> Changes in v3:
> - Patches 1/8 has been added in version 3. The dt-bindings have
>   been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
>   anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
>   syscon, so it represents a memory area accessible by ccm
>   (imx8m-clock.yaml) to setup the PLLs.
> - Patches {3,5}/8 have been added in version 3.
> - Patches {4,6,8}/8 use ccm device node instead of the anatop one.
>
> Changes in v2:
> - Add "allOf:" and place it after "required:" block, like in the
>   example schema.
> - Move the properties definition to the top-level.
> - Drop unit types as requested by the "make dt_binding_check" command.
>
> Dario Binacchi (2):
>   clk: scmi: fix SSC spread conversion
>   clk: scmi: reject SSC configuration out of the OEM field range
>
>  drivers/clk/clk-scmi-oem.c | 27 +++++++++++++++++++++++----
>  1 file changed, 23 insertions(+), 4 deletions(-)
>
> ---
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
> branch: imx-pll14xx-spread-spectrum
>
> --
> 2.43.0
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com
