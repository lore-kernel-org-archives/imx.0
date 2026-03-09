Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57AC3D9039
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 15:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069596; cv=none; b=jsHl/5G6mwEg+mhf7b03pNA5+ouunpqg7Vi3o6iYShgOu45qYSYG+HP9Ahvr1ggVn8x0EN+3gy9/AsPczVRzw+H8RVh2CaFAxh6LZLm7ByB2GdWN1emGyv6ygu3zqUvqvJ19+3z7RfPRjSNy65BS0vOiwc6wyAFAP2V2HNHAayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069596; c=relaxed/simple;
	bh=fLdlgK54rTn34EKZI8AHzVRLbm2SJ8RTjlamikvXF3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RpnHBgq6nh81MCowwZNqReL6GfcNegCoUVi7B499N3lLjt/GyMbBkew7fOBqPA58C+D197x5EQxpgWXhMIpexg4Y4DiKMhenR7nBbAIVQKxY4COpb+63/RngTmfo5rtRJZcdPCqvTxBS4KR89nQOwrDJWeGMNhWWWeLekPQ2KbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MzarPSuv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MzarPSuv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b96da7b2e2eso259681166b.2
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 08:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773069590; x=1773674390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=MzarPSuvwnMAgHTlePM7pp/n7yK/sZHu50Za+IVdG8OymlzT/FLMuxrkTF5iQ2wqys
         99wXZJml3PkP2S88JC1OiYgIKu7nwhD7ofSDpn0Um0w2m9hFRj+crjR+22b35b/KbPvX
         YUgjw95aKNmwYbZemzK+SymakxUXHslZqPDOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069590; x=1773674390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKq8ulzy5MHQKDxfFMVcrLftpi/uwWVl0kgu6a2rhEE=;
        b=AYDWbuVjmODhXSQBF0wMCppGVOwEIps8FtvuaMPErZ8Cl9z8l/j4RDhibYFn/4dgIJ
         oDildQ2wm7/7fDL8l+1TKUxr2i3TPaq0tgWBj9LdGDY8ZO4URaFm8fissBT3dYsszHUB
         AETNBW1KdaUtnmP5tWYK02Pqj1U5IKfta+DAZqOX8KrRvI0ZqCHCrVN4jZl4r9kUkRBU
         iDDDmti6LvEuPNBREcBoeIo0T8Zfuk8IIcpdjDAB3jFfALoK3J/VsTXkdjRJDPv/9Amw
         5Nwj0+N7+KVb7V4N++oVdA3hAkQq9sHzffNhfp8rpuKrJp7Jkw6f9WTI/JVevJ6AcjnX
         68aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/v+X7s4l9D5xToelm3wWeMDvCVMWFxsX2kdbmdFqWFKkIVFwkWinLm7/ndYrAX27jjpo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrcGiKS84FfXO5Hv2Y5rt2EciXc/X8OvCgjaUqU1wyMvYP72ZA
	9fMZHymzQyTL8V/VenZ4vBgRP1rGwa9TZBCSqzHcZ+GgqRmX6kHmiN0xwbdcdw22Qb0xJ/As8FO
	BmuiEqA==
X-Gm-Gg: ATEYQzwCoftoz3ZoRhY+SAFBnGgySBh0DpYxfrVvPLz55L1MInL/9DFEIqsafucUlfw
	EnfQ9Drt4C8R1Ph1qc4rmYc3aO1/Ddempw1wJyL9blAUmuT2u/kpRx09EFK4dKamAgdbK+UnBdK
	saGOOfHnrc+gTdSs4Yb2x59tqJlz8OF1bSd6yIsK9GqHw7oyPtQRVLpDqkJDFu1GJzkaEQuq9rx
	vTvN0xXs1PpuQ/5uxYbWoD7YFenNBHuzpZ38ybD8sTHiYS01WfYznPSxr+wswbbWBgS/lfa+8HL
	IrS3+nn4hj3nhgqTA1QBBkspZ0UfHi75Tfzsum47VbAYl+l2kPRDAYOSzgf2Bws3LeRxrHccH1y
	2bnDb5GgXSeqn44t7MkmJNe1q4/bnMBhaBRyGpjUogsla/3xSLYAtLu/GbJNUTQhSNPYJrlC2Qf
	wYFaELENdlGY5MUWikIvNSdKMeWfOKH1PjbqlEGvzJpl9U8nmTUTAem3i970cibA==
X-Received: by 2002:a17:907:7250:b0:b8e:796a:fd5c with SMTP id a640c23a62f3a-b942de06208mr679047566b.27.1773069589981;
        Mon, 09 Mar 2026 08:19:49 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm375765666b.9.2026.03.09.08.19.47
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 08:19:49 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b941ec6a368so467107566b.0
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 08:19:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+MHh/lzla3ONZsutft6O3ax9fBXAcQl8PJVhTfZ1iA3rDg22O3pOLzpAVU/uweidoebY=@lists.linux.dev
X-Received: by 2002:a17:907:1c2a:b0:b96:dcc0:2e19 with SMTP id
 a640c23a62f3a-b96dcc03e2bmr431706766b.56.1773069586848; Mon, 09 Mar 2026
 08:19:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260216181002.3475421-1-dianders@chromium.org>
In-Reply-To: <20260216181002.3475421-1-dianders@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Mar 2026 08:19:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
X-Gm-Features: AaiRm52PitiYzwSf40xttz_JauQBZgQS8kA13tji_SRNQ2F75XcOox36FcsJy20
Message-ID: <CAD=FV=XosP+rpT7w1Dcr=Xu7K8MCnA-=hndCgvsdwRAeVXuUdA@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] mailbox: Stop sending NULL mailbox messages
To: jassisinghbrar@gmail.com
Cc: Frank.Li@nxp.com, Santosh Shilimkar <ssantosh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, daniel.baluta@nxp.com, festevam@gmail.com, 
	imx@lists.linux.dev, jay.buddhabhatti@amd.com, jonathanh@nvidia.com, 
	kernel@pengutronix.de, konradybcio@kernel.org, krzk@kernel.org, 
	lenb@kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, lucaswei@google.com, marco.crivellari@suse.com, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, shawn.guo@linaro.org, 
	sudeep.holla@kernel.org, tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jassi,

On Mon, Feb 16, 2026 at 10:11=E2=80=AFAM Douglas Anderson <dianders@chromiu=
m.org> wrote:
>
> As talked about in the first patch in this series, passing NULL as the
> 'mssg' argument to mbox_send_message() ends up causing confusion and
> quirky behavior inside the mailbox core. Despite this, there are a
> number of drivers that pass NULL.
>
> It is plausible that some of the drivers passing NULL may have been
> taking advantage of the quirks of the mailbox core. Specifically, they
> may have been taking advantage that calling "tx_done" wasn't truly
> necessary for NULL messages (it was a noop) or that NULL messages were
> passed onto the mailbox controller right away without queuing.
>
> This series introduces a new API call: mbox_ring_doorbell(). The new
> API call tries to mimic the specific quirks that were helpful in the
> old behavior and it's expected to be a nearly drop-in replacement.
>
> There are some subtle differences between the new call and the old
> behavior, but it's expected that all of these differences are only for
> cases where the old behavior made little sense. The description of the
> first patch details these differences.
>
> The series attempts to convert all in-tree users to stop passing NULL
> for mssg. As per above, there are some slight differences in behavior.
> If any of the patches are causing problems, they can safely be
> reverted while debugging the problems. Eventually, all code should be
> converted over to stop passing NULL mssg.
>
> Changes in v3:
> - Suggest mbox_ring_doorbell in the warning message
> - Updated patch description based on Cristian's response.
>
> Changes in v2:
> - Instead of just documenting NULL, introduce a new function
>
> Douglas Anderson (15):
>   mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
>   ACPI: PCC: Use mbox_ring_doorbell() instead of NULL message
>   firmware: arm_scmi: Use mbox_ring_doorbell() instead of NULL message
>   firmware: imx-dsp: Use mbox_ring_doorbell() instead of NULL message
>   firmware: tegra: bpmp: Use mbox_ring_doorbell() instead of NULL
>     message
>   irqchip/qcom-mpm: Use mbox_ring_doorbell() instead of NULL message
>   remoteproc: xlnx: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_glink_rpm: Use mbox_ring_doorbell() instead of NULL
>     message
>   rpmsg: glink: smem: Use mbox_ring_doorbell() instead of NULL message
>   rpmsg: qcom_smd: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: aoss: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smp2p: Use mbox_ring_doorbell() instead of NULL message
>   soc: qcom: smsm: Use mbox_ring_doorbell() instead of NULL message
>   soc: ti: wkup_m3_ipc: Use mbox_ring_doorbell() instead of NULL message
>   drivers: firmware: xilinx: Use mbox_ring_doorbell() instead of NULL
>     message

Just checking to see if there is any addional changes you need from me
on this series. It looks like it's -rc3 which is maybe an ideal time
for this series to get some linux-next bake time? A good number of the
patches in this series have Acks from maintainers so they could all go
in your tree, I think. For those that don't, I guess worst case they
just don't land right now and I can re-post them later. ...or if you
think they would be OK to pickup that would be cool too.

Thanks!

-Doug
