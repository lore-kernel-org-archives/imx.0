Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1C825DAE6
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 14:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741705097; cv=none; b=JSDq+hbq8bU7HllrbVjaOmY4kSqpOi9Ig6XuO+s1WlqXMh/4rxaiL4voQnN3Z+AkAYvQqkwLv2Awe2AFjniZp7r0UEHj79El/COkN0d75XlKtL+q1Hs5M5S+KwwL2tmVvurXFWNr85QwOKpoiUgnC547h//DylV/RQZELoowro8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741705097; c=relaxed/simple;
	bh=y4ryVf0YNOjwtuAvfEB/68jmLIXNfkpji8SHUgQfHwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9BI6JlKLZm2VQ9h3h1f1D2rzJKXV7S4xTp6tcfvpLv6WtkgPCFojpuEAg5kDGOulFu80eeSPmZurcr+ldNOkZi9XfvZQblHYrJMuL3pxnumocmMbqTYTxFelEpHxgg7coAveIa4aQmKZWuiYFKLP5o3t60ozxV30Ihg5SCBS6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR0tVOSg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR0tVOSg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09BF8C4CEF5
	for <imx@lists.linux.dev>; Tue, 11 Mar 2025 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741705095;
	bh=y4ryVf0YNOjwtuAvfEB/68jmLIXNfkpji8SHUgQfHwo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NR0tVOSg1upZbE2fEnyq9W9Y3RVKJ+tzky3/D+NrptcRvtdtGIWka/OYqly8MeSpp
	 lo076w/j5pWmgipzkujd5xbRgbtBnKD17m9kM2OOZLTqto0fy8xOrPzXDq5DKv+s2l
	 8Gnuyx71HplMB2FE9EZ3yBpwlxvZg9Ck8WL5ZE8KswsxlZ2CQjzvaOOFlwg1F5IpN6
	 fIR7Ht2Iph5kvMCIHhYCLUsas1FS7E3k8G1L9j03WTAdlqfL/yEwBslCuWgmURWkjD
	 oHhikPGChRCkC7VT5m/rET4dXsDx0+mTsLKnuSrGjKF+qC6t0/zyA1TRHC2nXV4zsX
	 6kDLqw8p1twvw==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2bc66e26179so2361851fac.2
        for <imx@lists.linux.dev>; Tue, 11 Mar 2025 07:58:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVRLFxY5uAo+aQp9Ni+fZ1DwgFJwaFkWKQp7YU8SMlIY7Ba3BDD21UnbAo2UmL87GEBWj4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeX2D3PqBq+EH/VNXa5cPrkrymrKavkyMowp+oa4eLNB8Bpbx7
	Xw7b+e8CfhQXczet31YATuGG5YBP6/C3+Ve+tJYtSswOxe5T7ZhtXxYDcOWbBfowpTbZJEu47kG
	11c+s3BiPd0zTe5NI+5UVxYlRrmI=
X-Google-Smtp-Source: AGHT+IFQOxYvpetHFZ5qF/modjQEJMQgK5sXcQo1XO+E1NqNBmeXGZ0DgBu5WKIIpycj+LOLM2pmlvVhXDd30xgHFNo=
X-Received: by 2002:a05:6870:b906:b0:2c2:5270:f182 with SMTP id
 586e51a60fabf-2c26136df6bmr9904732fac.39.1741705094125; Tue, 11 Mar 2025
 07:58:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250307145547.2784821-1-ping.bai@nxp.com> <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
In-Reply-To: <CAPDyKFqsE4nArB+Qn5gH5P7vVePpZ6Z7ruas2-EGYsctGV-=4w@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 11 Mar 2025 15:58:02 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jjezx5sUEZwsbsw-iZiwbirmB+690-syOCur26DvOSNQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jpg9YGKxiXZ8IeOPwdPNsqgPkaGl3fl_2Y1dOoOEeGA0VymC_oHOAASzwc
Message-ID: <CAJZ5v0jjezx5sUEZwsbsw-iZiwbirmB+690-syOCur26DvOSNQ@mail.gmail.com>
Subject: Re: [PATCH v5] cpuidle: Init cpuidle only for present CPUs
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: rafael@kernel.org, Jacky Bai <ping.bai@nxp.com>, daniel.lezcano@linaro.org, 
	lpieralisi@kernel.org, sudeep.holla@arm.com, james.morse@arm.com, 
	d-gole@ti.com, anup@brainfault.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, imx@lists.linux.dev, khilman@baylibre.com, 
	quic_tingweiz@quicinc.com, quic_yuanjiey@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 3:43=E2=80=AFPM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Fri, 7 Mar 2025 at 15:54, Jacky Bai <ping.bai@nxp.com> wrote:
> >
> > for_each_possible_cpu() is currently used to initialize cpuidle
> > in below cpuidle drivers:
> >   drivers/cpuidle/cpuidle-arm.c
> >   drivers/cpuidle/cpuidle-big_little.c
> >   drivers/cpuidle/cpuidle-psci.c
> >   drivers/cpuidle/cpuidle-qcom-spm.c
> >   drivers/cpuidle/cpuidle-riscv-sbi.c
> >
> > However, in cpu_dev_register_generic(), for_each_present_cpu()
> > is used to register CPU devices which means the CPU devices are
> > only registered for present CPUs and not all possible CPUs.
> >
> > With nosmp or maxcpus=3D0, only the boot CPU is present, lead
> > to the failure:
> >
> >   |  Failed to register cpuidle device for cpu1
> >
> > Then rollback to cancel all CPUs' cpuidle registration.
> >
> > Change for_each_possible_cpu() to for_each_present_cpu() in the
> > above cpuidle drivers to ensure it only registers cpuidle devices
> > for CPUs that are actually present.
> >
> > Fixes: b0c69e1214bc ("drivers: base: Use present CPUs in GENERIC_CPU_DE=
VICES")
> > Reviewed-by: Dhruva Gole <d-gole@ti.com>
> > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > Tested-by: Yuanjie Yang <quic_yuanjiey@quicinc.com>
> > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Rafael, I assume you will pick these up? Or let me know if you want me
> to take them via my pmdomain tree.

I can pick it up.
