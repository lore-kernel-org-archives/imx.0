Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D9832D7F1
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770116828; cv=pass; b=GglUqbEo4ui6lYsF8GKPZvz9uvSiyYdMnsM0ho7nqSiwrRwydW3AtF8uTeWum5wga4gXEJ06+4pe2+ReWr086a3C5t1WDbUtZkrgpISS5DR6ECI2OXRKT4zN33B73MxlLVv0TNI3krEgQk5hq05PRESomTDTYLZAb5KIw8wTsfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770116828; c=relaxed/simple;
	bh=OH7+HSlnA2x81hRfL4m4AByJ0bZZKFk99H50SaARSyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QYslYaN5QRrIwWGF1HqbXC4IejWFBC/kmj0lK2YWh8ofR3+pgd9WzXf5ACP9yvwTWILQ9+u5X982eQcNztaa/ELqwBfcw492lyuGSJOda9+FdojEEk52Ahp2uG8ilx2x6IZ+/LNa+MLUYhHPetjHeRIXFX+xkXdDXXpJeV3Li4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PAw68MVk; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PAw68MVk"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso6220742e87.0
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 03:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770116825; cv=none;
        d=google.com; s=arc-20240605;
        b=cLoitj/xq0k9yR96W60bySqarV3gnyrY60/+q0UCSfpqlHl9IAKpSB0HCngh6CgZM7
         WU8Cb9IDnIkJtAODQPP7Jby41BwjTYmz8CK4Tr/7zrsbPgK9m7qarK03nNVbrdlrNjBp
         UXzpLDkkFMfJL4Z60K0C2wNuRrFsddBH/MuSFy6ORsIr7WfUfnnqAMbIwk7oxrb/bdni
         WSkNS5AFnkj/qdV558bSmKrmznHkP1UHUN7ks7JIXVzxQjpwDdxDqTOZktBQDTjli7k5
         dC26ZlW3W/5rTytopfBGFvJhQSkk+KpcHY5tFjCS8yTi0O/OxYXMySjOQuuDau474Q67
         ruJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=;
        fh=nbSEHr8czRamHlIWqSe7h7fkYe5hOX6fVyOft6+OCgk=;
        b=dHlqgRFJDqgW88eWAEmwyY18j7ED8VKOIgGf3QxLU3dEgrstffVPx64MoXuwPXVku2
         zv2Vkbpfqe98d3FGbo4tAzNKbq6jlBauhxql/x3y9PU/s/Oc0h7HN21Ex11wOlisulhY
         Yddok3+KuuZ3NRe98MFix9dyZTzJRisG8bHhlVUlK1et3JjVxeM9EPNZ79j+JW791uYz
         epWfPhEWT+r6mOx2Qe6DZx7uQ4Dlx7BLYTeAYNac8RqnknF2RD781MpuOWswfASZSSUC
         L9skhC5lng3ic2B+Yrzs5VEz5tIYOiajyULYUh9v8FlLuAgVHh8SN18O+RDW3kBy0Hy+
         OBwA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770116825; x=1770721625; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=;
        b=PAw68MVk2SfkT44QKeFkWpy1/ia62gwxxSuwyTySPqk3MvyoVu/gNIr2hQodyYjBXA
         eKa2Vh3eX3aK/jTOXRf6HZfpVwQH7yNSaUhQ45IFlfn8oPKlrzChwezoRgrnfOh7glSv
         4VRXd6CervWK5elOYIkyzHHiqwZkZVIava8Vcu5aXpRR6Nf/tz+PvZSfD+T+P2r1/C3I
         qd0xOGUFR5fJK/Q/axcbi/iQPxkKSJLpokoutusVlUF6FTDLY9L7bcuTFN8DnDW+ovvQ
         WGs46PrR2bv0xccIfuuSaokSQNQsaMpLxeXd6Yfa2KE5vr/ZUS1RyIleR4aEm/j/keIa
         fehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770116825; x=1770721625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpau5hvO+i/E0AiXJ5P3htmR+ezocch+kVwOVkTz9TQ=;
        b=hTwMHpYu5iB1MRWkqrLE3yO8z0Y9v8rPVR0YTItKhyYY/uLYJ3kah+IQRgDIynWPMx
         azVsD4m6F8w8+qWJKoK8HZuQUo//kX735BsdXrik8bksjU5qNPdUmTbM1ocx5CkerNTW
         /zahtzIaKE9Zi+isEDiIeH7S+QfyYI3NtTGISCTz8uGmiq2ZxSsn5Oc5VTlduvRqN3lK
         cLxa8ld5H1Cx1D08ocrigT7G336lhksyT26cnYf/e1oa6wVUiDpg6/e6/RsewVRlSxs2
         JIte1ZO8/00sWKlrnTkLwwIoN0hvFV+UwHrCipHuMZORNrggDNOVUVovtNYHakiTSyvA
         9dmg==
X-Forwarded-Encrypted: i=1; AJvYcCWI9xJdorxODky/v+/fzLOuhDWSZjnrbgnI61CLlfP/0wCHi+ZdJ1YI745KOdhLRqZCUGs=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrF2CBVUrvUu+UVjJ1PZ6ht/LYZE7nntBB4Eqyq8IaEvTjgOwz
	l9bVkVLIJ8MAb68kb1fi29XsWdh5wIJPyEiam+w66wqNTRRpRAFSstjd2h3ZA5ewjygtfSqDukD
	IqQrOiZy+NVUo900iyKq69pZha/j1/85XYtwZtlF6Aw==
X-Gm-Gg: AZuq6aISiTXUI6411G8ZRnZQBcQIfLYIts7ZiMt5MPH/MXzwMV1ET57RsBqeIlzikd5
	T5khft4Sae8hzBmxcYkcADQTd7ZuqubEGHKb8sq5RbnNHfj4w8Ysxj0zvgFtpkqZUFiLF5ozB47
	FQHtz9rKofqTmvTxmKC14L05hVthzWj+Q1p6309UwXuyNl6PAbboDTMoYnn8QAuhYNrqrobb1P5
	RxACOVyG7LKxETpOrqWSJcR4ieWJEP3JEc5ZLYFtH9hk/ub4Y0HhpEY+ZPi/Bqd4iKuvNRH
X-Received: by 2002:a05:6512:10c2:b0:59d:a4ed:1aee with SMTP id
 2adb3069b0e04-59e16424bf4mr4915624e87.40.1770116824273; Tue, 03 Feb 2026
 03:07:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260202074730.738760-1-xu.yang_2@nxp.com>
In-Reply-To: <20260202074730.738760-1-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 3 Feb 2026 12:06:28 +0100
X-Gm-Features: AZwV_Qh2hAOTL2iZXhJf4HtRUDzm3SZegUCoMSRIOsgW54neZTtXwIBhuC9chV8
Message-ID: <CAPDyKFpqfo1R8Qkq284L9DTURjZnvm_n8W3a6KQTomg7A-M_Ug@mail.gmail.com>
Subject: Re: [PATCH 1/2] pmdomain: imx8mp-blk-ctrl: set awake path for
 power_dev if attached device needs wakeup
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Feb 2026 at 08:46, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Current design will power off all dependent GPC power domains in
> imx8mp_blk_ctrl_suspend(), even though the user device has enabled
> wakeup capability. The result is that wakeup function never works
> for such device.
>
> An example will be USB wakeup on i.MX8MP. PHY device '382f0040.usb-phy'
> is attached to power domain 'hsioblk-usb-phy2' which is spawned by hsio
> block control. A virtual power domain device 'genpd:3:32f10000.blk-ctrl'
> is created to build connection with 'hsioblk-usb-phy2' and it depends on
> GPC power domain 'usb-otg2'. If device '382f0040.usb-phy' enable wakeup,
> only power domain 'hsioblk-usb-phy2' keeps on during system suspend,
> power domain 'usb-otg2' is off all the time. So the wakeup event can't
> happen.
>
> Let's propagate wakeup path to virtual power domain device so the wakeup
> event can happen properly.
>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 34576be606e3..f3bfd6d22722 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -804,12 +804,20 @@ static int imx8mp_blk_ctrl_suspend(struct device *dev)
>
>         for (i = 0; i < bc->onecell_data.num_domains; i++) {
>                 struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
> +               struct pm_domain_data *pdd;
>
>                 ret = pm_runtime_get_sync(domain->power_dev);
>                 if (ret < 0) {
>                         pm_runtime_put_noidle(domain->power_dev);
>                         goto out_fail;
>                 }
> +
> +               list_for_each_entry(pdd, &domain->genpd.dev_list, list_node) {
> +                       if (device_awake_path(pdd->dev)) {
> +                               device_set_awake_path(domain->power_dev);
> +                               break;
> +                       }
> +               }

This is really messy in my opinion. Ideally the above should not be
used by a genpd provider as it's internal data structures are managed
by genpd itself.

If I understand correctly, this problem boils down to the fact that we
should have tried harder to model child/parent domains, rather than
using runtime PM to manage the parent domains. I understand there are
problems with that, due to specific power on/off sequences we have for
imx power-domains, but I wonder if those could be managed better by
using genpd on/off notifiers?

Anyway, that said. Rather than walking through the list of devices as
above, I suggest that you use the ->power_off() callback for the
corresponding genpd(s) to dev in combination with a genpd power on/off
notifier for the corresponding genpd that the power_dev is attached
to.

More precisely, if the "child domain(s)" that corresponds to "dev" has
not been powered-off (because device_awake_path() is set for some
device) during system suspend, the power-off notifier should return
NOTIFY_BAD to prevent the "parent domain" that corresponds to
power_dev from being powered-off.

Would that work, you think?

Kind regards
Uffe
