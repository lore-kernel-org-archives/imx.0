Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C829433FE27
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543022; cv=pass; b=LdiWTCrpY/NSDtwKiX8eR2z+0HmJrhet7pnB3bsSWJ3vneIzCxdnDLNX3VfQjVvex2EYU4YhwxDQQGjnUzuOXqpeL1jlkKxvUceIrO/8WhnZQuUKwJm9Vrj/RT0C633FeADoyISHUpnaK4lRyrW/urz65mqk2Y/yzyqPrlaNhRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543022; c=relaxed/simple;
	bh=bdXuAHR+W7DcDsgTssbNNylZwjKna61a4d2JwD1CRZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FySihXVLRy7et5AV0+lHG6R1BRjzdfgfmW/hmsuv2aZ6CF8scGOjqVs3Py6cD3J0ZGPs7sPTVKUudrvfgOnClmj19s1lXG19hwpSqdH7oOP2R4o9iKgrJV8T+OaemogacYVsLZOgJSxbTnV6bq2f76Vh/PSzrDhuAkh503E7f0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA2w1T63; arc=pass smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA2w1T63"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-4152698e745so291901fac.1
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 05:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772543020; cv=none;
        d=google.com; s=arc-20240605;
        b=R59T9K5EOnoQcXL7nYNP7efby1kbWRfqHwTgKOfA6XIJ9png5KiL50dy21mc1h5RmR
         4IiOIrQnXXngjbqH+cCCUsO7YH+rEJ8iE1jJAoTFkNtM3TUxpFinvT33SgleqvWjA56R
         YNqqYbchEVDqF+4CKoHofL+HjjvyPh9+tJZuuAJy+BHcM1moI8hk2qfziH2DqyPG03ey
         N1mjC630hp1PMrA8dZrEGQt0rKhPFhQ0UKlBC6Mpru8opz4dEt6vyJZVmTsTEBrUp9th
         PlsDRUO+wP/IoWTRGB8Mx+9EAP68k6EST4vWsKvW6uv9DOvt8S0YEaE8Dfpqzv0BXWjx
         OtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        fh=is4cPssltmZX4aerWv0j0hAgkwnG5jzTNcncbrP0DiI=;
        b=aRG7oN9Pn+y0nM6C3bE/pmZfNLl8fzXOgVBO1cWnr5Dl5RjSPUtyobdNhTwX1cU6Uv
         KA4Ji60CShYI9oHFfnEnH0cbcRPUPoV8LFKqyowLoeZUJn2aQXt2pp0LWk7Lss8QqK9q
         l1CjhpcsLnL0ajO5fl3dOOXEN42L8rxsKwimQF8sWiWOsHq6OzaMf17xjt1nrRrApSMT
         49/QfbWXn89383gF6IgcptBf7JvDFu0ulAzTOyfOQEWEe+53pxT+39Paqc6obOq/ts3I
         lv0K6FJSfyBUXDFDH6QVnD7vHWw3+MN5iGGXiuWWUKsg+Ay6kZONvdzsMyf8fLc9A9FB
         0HRw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772543020; x=1773147820; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=UA2w1T63xwSD9UnMQXWyB1dSF33loNrcnpqIS/AOirkl6abRqHjGVarsenD5SucfCd
         L0cxi6GcPQ+IhqHV14K3oMIRxexEEBjwyIwU8YPimWKOdsnnhaV0r9EZmCRv4cekbVN6
         qIm6G89rT9ogN+9dgCKIAEl0lkqgIM2bRYvIpR9gvpgMVouTFUShbj/pT+S9RXZecsbv
         EyAZZl/JD/tljBKVPi4fE5hMycKtmdrwERpF9k2ubBNTC8sV+wLmHTk+uuo0y2y6vHqC
         XsTg+gLBJ/VqJ8TExh2CUET8yS/VBjM3Ctf5Pomp6pRFxYbTgC41QBHATNa1dqkeJn93
         j+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543020; x=1773147820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=B/3ZVK0lHypN/VEEmaC70vL8Wgna4srYWid3mMFRQE9ZsAibkgdrdXpY0bl3sQNm1N
         5PvgY1s5Uqj3zxD0tVWF7dJPd11e3CGL7RFEAAM03XllFHdN91bChr0Cm7e28aZZou9F
         CXNsBWcMty2Aq8ottv9TkXnlP6FNKRRCC+PEP7aESBfaWYPV81N51kNMlxmt4DdiuBeB
         sj5UoMDyYIHxiFZ5UQ12NSCQMBlpQl07yxcn7T6FYVdWIuM3wzcQJlvoP3keBhNHvkrq
         rEF3hqCrSfOl5/Ru5XQiNdyvoYU9emBiuxUwVZiepa2jYO30efVpJYFPp8xCIWUM/Iwt
         B5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjyBbltxQ23YJYNB+SjlU7BI+dvyt0BBMT/XpNGuDgolDHF/IrtFFjMM0m55Pwj1Rieq8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxafadutgCMR2ZyFjX0oWP2ZJ8LUGQWBwVmPmEvgLs1U1KrVjgq
	yI3e2iI2pMVejnXWXqx/QDz4Khz4MZrTnOkU3V867ApeS8C+YwXhJgmUXye96cnGFgCIxx/E9Yy
	evPK9gZJPqXofsmbPormhJskra5RVDSA=
X-Gm-Gg: ATEYQzyfeKX+DPeI0s474UzfI4rcsMopwQo+/7zZwzdH43/+5y3DByUXKxKtrn59SLr
	Ak5c7wIbLuVr7TPhzwEW4ggPlVZQBElDL44qC0xx/MUzJ8bNcplf/1R4b7JF3RlUuQaelc63C57
	0TfUA/2kpwEV+bWb0lGW8tOyBDfZC4CGSR2+JWe9Fm5Ti0QoABdbgC7p/mfzXY330gB2mnLrozj
	IRZ4mxGy00jGeufU1H2qJ5Dm+64FUp6Mihz3Bk4RauNHZMjKc8fnN41SYOjjchQUfqiZ5Jq4jgp
	IrjhlE8fRtG4gNbn/ri+aGJo1op/QIuMW8rBl82vRSDh4IcCT4FIm1JVL1PosDGjXj2yd2/loQ=
	=
X-Received: by 2002:a05:6871:7383:b0:3e8:9e7b:4ea4 with SMTP id
 586e51a60fabf-41626e21440mr7566575fac.6.1772543019367; Tue, 03 Mar 2026
 05:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 3 Mar 2026 21:03:28 +0800
X-Gm-Features: AaiRm51hHETXLy5xgoyPjMD6CQcJQj3Ex8YjBm7PX7a5CmSkvNYD_5jZKUYKtjs
Message-ID: <CALbr=LaQoV0L2dxiHKvoP2weZNWEXXG434ir8k-Ej=ouBiEWHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 7:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.

Hi Danilo,

Thanks for the v2. The code looks good and the bus_type approach is
much cleaner.

Just a minor note on the commit messages for the cover letter and
patch 1: they still mention adding the DEVICE_ATTR_DRIVER_OVERRIDE()
helper, even though it was correctly dropped in this version.

Thanks.

>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Changes in v2:
>   - Drop DEVICE_ATTR_DRIVER_OVERRIDE() and make driver_override a
>     struct bus_type feature instead.
>   - Add driver_override documentation in .../driver-model/binding.rst.
>   - Move kfree(dev->driver_override.name) before release().
>   - hwmon: axi-fan: Use NULL instead of dev_name() in
>     devm_request_threaded_irq().
>
> Danilo Krummrich (4):
>   driver core: generalize driver_override in struct device
>   docs: driver-model: document driver_override
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure
>
>  .../driver-api/driver-model/binding.rst       | 48 +++++++++++++++
>  arch/sh/drivers/platform_early.c              |  6 +-
>  drivers/base/bus.c                            | 43 ++++++++++++-
>  drivers/base/core.c                           |  2 +
>  drivers/base/dd.c                             | 60 +++++++++++++++++++
>  drivers/base/platform.c                       | 37 ++----------
>  drivers/bus/simple-pm-bus.c                   |  4 +-
>  drivers/clk/imx/clk-scu.c                     |  3 +-
>  drivers/hwmon/axi-fan-control.c               |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c               |  6 +-
>  include/linux/device.h                        | 54 +++++++++++++++++
>  include/linux/device/bus.h                    |  4 ++
>  include/linux/platform_device.h               |  5 --
>  sound/soc/samsung/i2s.c                       |  6 +-
>  14 files changed, 228 insertions(+), 52 deletions(-)
>
>
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> --
> 2.53.0
>
