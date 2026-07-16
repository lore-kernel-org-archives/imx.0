Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5E73CC31F
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784195448; cv=pass; b=lrQCmtMzD6I418KMn4ZhLGMtZoCUYH6G0aMvrG9ijrpMO7quuFPd/cmySbiMPPKGVk/2Fzq3t/nadQzYT+KrnxwfVoNfcRn3mLUP4ER3gSeKR1x43xZC0TsGLeEVsxly37isQpIXfvixbxmDCCapEz3r9AAy9vXPgNsI7hWZIRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784195448; c=relaxed/simple;
	bh=4PHDdxADWcJXcHELSsybkbYwxBBaZNxU4xqJtB2mqtY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RQeSL4nZDZM7RdFTe1mV7EwszuKoyXBMk0lAvl8YOt3iKbKX7/ZpzTMRzf/fcHdCSbPDnq/+cE6U/iAvoz31xHJepLnTQdvfb0BLItM8dQJqTRDRnrHLEZc/y2BfiHSVXyLRdZHgVRDfr5Yxt7QqTUuuQ7ASoiebuxUDsqAS29Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mechasystems.com; spf=pass smtp.mailfrom=mechasystems.com; dkim=pass (2048-bit key) header.d=mechasystems.com header.i=@mechasystems.com header.b=LIPPpTrj; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mechasystems.com header.i=@mechasystems.com header.b="LIPPpTrj"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cca0c5799eso38629775ad.0
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784195446; cv=none;
        d=google.com; s=arc-20260327;
        b=AF5NE2Ne1FZ7/ybvsZyMHDSW8IIQoJtmx2AKUQxqZQMNBWHp2+ysgjj/tf50bt0Dmc
         SpSndWhzXAvomIU1TJCTzT//vkkYUB/EcwagfFChgOiXMkHMd4yzUWSkBUihy9G7ofBW
         hMk1Y/Z7U/ccnRhGGhRMVMjU7UMeiMkeY4vRl6sLZVfZV3NwGSL4zj0jYWrMlBS1YaGQ
         de1ALNcIdtSicrzrXFWHJULUk/i3/CmB5M4cqxR5TEZT+0k249Upq8q33FYZg4UzusQd
         nTCXTgjONF7HwABjvFG1/7XI/Ouyvi3A3mmqBvD0X2fVNxAVsrSk35vFpD99bPvhUdWw
         E0cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=7BnpV4VIJWWIXN3EfRYg7aDjYvj13ejddTvZNuKOsQM=;
        fh=QcJNWqvAtH06k/2wVADT2dfXyoeqq0j6YcrG3AM6Lus=;
        b=r3mlLMVjl/C3iGeBpGWi5EpBpeBomCQjUXxaFWdpgNfhBCbfppOf4OiK1Y9VCU6+Yu
         S3aYzumsXQFMVMZL+fTOJNDUorJZLVWC8SlcFR5pZ8iXXE8SXDFiT9nKzcoRfiZcAU34
         f4OWcDkylcd7FTW30qLK/JZQTEIWazFv3HRXg+q1lyaJWKB44HydA4oBVGqyV2MkATvs
         fAHbpRNm9W+zt6YTlQthsab4x5Fk7zV6qO8ljmSPIILkDLXRn4MjIFUY7iQxibOvHt6f
         aLFFh1JRAblEaSmMw6D6trJRP0jJfF0VBRM0oOPznPzO1TifLCe3F6hOQo6I2mk2sn5q
         Acag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems.com; s=google; t=1784195446; x=1784800246; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7BnpV4VIJWWIXN3EfRYg7aDjYvj13ejddTvZNuKOsQM=;
        b=LIPPpTrjBnTU04os57mnXEoK9wtDy1G3F+9SkMV0y9Di69WRuWkjr+KONg9qtbU7Ba
         egB9bYknZ2DA3bpOJbBXFICN7OUNFbKxwlYmPQ/F1sW9eeb2C4CAtAwu/ykJN+mkcD7y
         MefrQzfoDpgZqT2FXdeLd6XiDWhYiaj+Qu1lgZmhgpRw4y6jz80cEV1lV6iv9+SphM2b
         E4b1l5jHnQ/1NQSKVBV/+20xKaLipBBeJhvTAU6FZWSKoXrqA7z9mEb1FqdOiNVkeyU6
         Ve0SJ3YsWQ2XlS1alPs/aIIBt+AJZEzCNP/vrgUz+Z7jKo2Uww5BU5snbdf9tL3IHHfX
         RExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784195446; x=1784800246;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7BnpV4VIJWWIXN3EfRYg7aDjYvj13ejddTvZNuKOsQM=;
        b=WeHp+wK1qxEHBuI9+d5i+DZtAdDQcLB+jznLSTSAJ/nnzLnSota6m9iL9yxbKpy1YQ
         +AD1RuCQrEGwglTL7NYyoKL+A95BcrvIhRnNXqT/TypKjGfMWpT2euR/QeI4h2ew1u6/
         jb8s3wdR1kw+zwacuFkC9Hf7AAB4FBssi6Ox/4CUY3lwCwIf86AfIQ1ZY8lwjHHHeKzC
         opuvu0ep2QFJZETsQB5F+hEiqo8ylWjIfS+XQ5LE2cwKf6AK3rlXBrRzGGn1aEgWRBTW
         gC0hJg4RiiJau/ke+ef8mgixlZUp4J7sQbWqG6CutSVg91ov8ZAjFM+zOCrCqQgoCVGn
         jL5Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro2dcb5x/vaYqy9jkabSWB4vcK7tELQ+DZKh1WK+53prXWx0XaPdF5dxbdnxYo2Ap/JKRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOZ/lyC/DCimSfBL8+zqOrXXazNVOG5sPQvpG/yhOsF5rNF4sA
	dOT5HQ37Iwe2alqtUPjlWJMI/GmmyOxDZUXq9uyKUjgAbbp6zFoBARwtNDeb4X/bHlZ/yfmck2q
	X4HmifqmXoBU5J3dEqX07vyHXlKGe5l07ofQUMCS2OAhikp/5QulRrDg=
X-Gm-Gg: AfdE7clu+RO7AdjTd6SbDsJOKz+t3RFefXEU8dKaMfks/lv/WyRUOUYy+6Pk4y7gZaF
	zvkHBG46BSIR+Leb3rPAT6Z6t4EHFYPoddGqXVZfIZEiTjxmKpMJ6DxM8OPjeghXjHfPXqCRUO/
	Qy1bcBT5U0vEGXXC4tKiXR0y7GRR1fnjhA2Kjsb0nYIND467x6ifYxgrgiBPwBYm0XrZwuZEWMF
	0pYhrg+tKnsBlbTnbJbcyF0YyCD4JlH4P5w8EF18tnRnjG6Nu3zh7BPfM0k
X-Received: by 2002:a05:6a20:c989:b0:3c3:94bb:ceb4 with SMTP id
 adf61e73a8af0-3c394bbd078mr1152070637.70.1784195446147; Thu, 16 Jul 2026
 02:50:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Thu, 16 Jul 2026 15:20:33 +0530
X-Gm-Features: AUfX_mxWjVGz1D1bqa6lo_mj3pKzEhFiBc4uYqQMLANU_mgqiNhYY5CmMp3yH84
Message-ID: <CAAPs2HTo=4+AEw1+vcU6c9vt_O2BfF+gv3FFvx9G3KLLzCOsHw@mail.gmail.com>
Subject: pmdomain: imx8m[p]-blk-ctrl: resume hangs when waking from suspended state
To: linux-pm@vger.kernel.org, imx@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, ulfh@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	bhushan.shah@machinesoul.in
Content-Type: text/plain; charset="UTF-8"

Hello all,

I'm debugging a suspend/resume issue on an i.MX8MP board, where my board
suspends itself just fine but it gets stuck when I try to resume it using the
SNVS powerkey.

```
[  127.955231] imx-pgc imx-pgc-domain.6: PM: calling
genpd_resume_noirq @ 963, parent: 303a0000.gpc
[  127.966055] imx-pgc imx-pgc-domain.6: PM: genpd_resume_noirq
returned 0 after 3 usecs
[  127.975922] etnaviv-gpu 38008000.gpu: PM: calling
genpd_resume_noirq @ 963, parent: soc@0
[  127.986183] etnaviv-gpu 38008000.gpu: PM: genpd_resume_noirq
returned 0 after 44 usecs
[  127.996201] imx-mipi-csis 32e40000.csi: PM: calling
genpd_resume_noirq @ 963, parent: 32c00000.bus
```

I added some logs inside `imx8m_blk_ctrl_power_on()` in `imx8m-blk-ctrl.c`
as well as in `imx_pgc_power_up` in `gpcv2.c` and have observed that the
problem appears to occur during the first MMIO access to the Media BLK CTRL
during resume.

```
[   65.145718] MMIO: writel complete
[   65.149030] MMIO: reg_write returned
[   65.152617] PGC[gpu2d]: clear PCR -> 0
[   65.156369] PGC[gpu2d]: deassert reset
[   65.160124] PGC[gpu2d]: clk_bulk_disable_unprepare()
[   65.165096] PGC[gpu2d]: ===== power_up success =====
[   65.170067] etnaviv-gpu 38008000.gpu: PM: genpd_resume_noirq
returned 0 after 137496 usecs
[   65.178348] imx-mipi-csis 32e40000.csi: PM: calling
genpd_resume_noirq @ 652, parent: 32c00000.bus
[   65.187316] BLKCTRL[mediablk-mipi-csi2-1]: ===== power_on begin =====
[   65.193762] BLKCTRL[mediablk-mipi-csi2-1]: pm_runtime_get_sync(bus)
[   65.200034] BLKCTRL[mediablk-mipi-csi2-1]: pm_runtime_get_sync(bus) -> 1
[   65.206740] BLKCTRL[mediablk-mipi-csi2-1]: asserting reset
rst_mask=0xc phy_rst=0x10000
[   65.214760] clear BLK_SFT_RSTN begin
[   65.218340] MMIO: readl begin reg=0x0
```

No further messages are printed. The CPU never returns from the
first readl() performed by regmap_clear_bits().

Has anyone observed this behaviour before?

Here are the full suspend/wake logs with PM debug enabled:
https://paste.debian.net/hidden/5b4133dd

Same logs with more verbose info:
https://paste.debian.net/hidden/9f544ae7

Any suggestions on what to investigate next would be greatly appreciated.

Best Regards,
Advait
