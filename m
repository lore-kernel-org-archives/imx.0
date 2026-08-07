Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA6541DE04
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 22:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786141971; cv=pass; b=DQfOY5b44MffQM/XXNCbhgltNfVoIoqSL1xvFLnsYj3H6i3M6ZzrnMeuwTXJCZL2oiRq6llBgg01HgiS6HwTnkmQ/o/FvmSp/jae5qEv0Iw9unLiQsoXWGkgwqPEvgdZQ3KBtRu2TkJMzk0mY0zicu9xZnU3S5V8bIWtkJbKJBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786141971; c=relaxed/simple;
	bh=JwddWGJZUPZTzv6QSlQzcPEBc+v0AeD0PB2XVffGRak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kUvk2VtNLwqqiZyyNzjQDPSKQX+PYx2pncKtBq+3ydJvyqfE1RbvuiDqyCqdIi+DysSXDp2j3A47K/JyF8OVD5szVT5kTaKDA3eHiS0wVwYm6AOACTxka5VG3jlFUfW47vE0K7+d0NUX07CkdVfTYe9Ky11GxCthhYfjzp/iRKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DexMfq7L; arc=pass smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DexMfq7L"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966eabad303so18920241.1
        for <imx@lists.linux.dev>; Fri, 07 Aug 2026 15:32:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786141964; cv=none;
        d=google.com; s=arc-20260327;
        b=ESl8d5HpUjkz+BWyhkDf8y0ZBP3MziUECQv+WllY5ZuDmx+g604BF++L6dn7K29oN3
         jShbF3zAol8pbopR6bwOK1BkTBx8Y/KzDJ4lkqFq81qNoXsT6JF8/HpoSIzNvMRWpZqH
         P932XiawD/Dj2wmyttsL03yJ3DmldpJIeqR1EyBZmd1ycd3fTwJTqmKqSHAOv0livwnH
         146NCAGkcsQwwW8l6Ijfvl1Hx/RQqMlS2VCmCWbsARNdILGwTrvzge1Qq5yIB64kUrTf
         yR/4VRfwyezzyztWm/NKCEcdcUb8gM6aFABY1nXaKbb/v6dfLUVYaCeoT/BlHCcLbMed
         d7Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fS+xnTply4IXaJCkwQuW09XhcpXvBoF9FN6yjQ3qbqc=;
        fh=PFRAurixnC/KGUI7Y54hOVN7HzV7HdXPRmgzppM2Rlg=;
        b=bz4uy9ztHirayYCZok6hlwNhPD2/92f3sL5zxQYSVCXPwxVSPn1EB3T83Pp/khjSwF
         h/CYTIkCW99I6wYwsvcf8z2aYCldTheh1q8ZyEeAVFgHeV40yqAoUbYbH0Abq7H3KGl6
         kY3Bo6uw+B6vIJw/+9LL/S8rhQ4EpDweRe+meGE2c+Pl6lvDQJdTjW7IX6W/3vDB2VCG
         Is+BaB5nQguIHDDMmDxhV2Uo7joFxPNcm1+gIz5sf8h6/4kqz8NE5tP/CaZ9WDyQv7iX
         88XBRMIcxGjGRHYRnScI4jmmOmJAUCImtI7M9cEh2gwSuYXVQ3T0h2LpnCugHvO0cobS
         Oc/A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786141964; x=1786746764; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fS+xnTply4IXaJCkwQuW09XhcpXvBoF9FN6yjQ3qbqc=;
        b=DexMfq7LdvFuVSn091ZgbTldkBMcLchT4JHjETQM5kAqBwMVGsjLOZRRt8eOw3F1ZB
         xrzPtWXfjPJiOFxBVzb5Q3G2T+ZuQ04/XScnBXo8f63xB3L9XLikkypPTjcPqlnf1bxx
         WZaEywf85sRqwMNC/hO5FBbL474PIUPFER61gJ8tlNru2C0amxiRsrs6+FqhMNf0yLrv
         NkT3trQ/lCEw2ZnD8YrvcxYywUyA/jbgHlqFLnFmXa3N+d9IKImBWBZxZ+96LVMGqcOo
         ZemAF94TRnTIcBE6LIkJEgOOH6aHGHvpu+sz1Ie01H2VtT4N9XwwrHPb3s2rejqgqW/n
         DAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786141964; x=1786746764;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fS+xnTply4IXaJCkwQuW09XhcpXvBoF9FN6yjQ3qbqc=;
        b=L6WJ1JTlT7DoRDw3/afZ9V/LRoZCOys8H5R5UTdOEwEezBRnzD2LHBuF+WyWe4gvsz
         ShM8m19Wf46zKYDJzJxfcrrMyMmXiaBJZxFK+ULL6wLi+2utjvlYX992VuNWv19Ddxhx
         CIcL4ZXfO5UsPEoKRq2VstT4MSlfEZpFsk2iYJ9zIp5LSPW3CSfRWp5nLzAuVR0Ue8Yb
         DcEGErvJD4a+X72EIkjVnSOpcGZ3znyYMeSfP8Kn85KUCt2mf2jjJTz0XO0c55d7H7R1
         VFVPoP1AQGy3w8m5O9SNbCo38Uxwt/pCR1KGF8UmlPvv7qfByWdh+NtC+yP+4jlgLslp
         pAJw==
X-Forwarded-Encrypted: i=1; AHgh+Rq82hpjXhcoi1SPUoW4rPw4ZIqxHr+hJMh1r3DfqAJ8LJE7xhK4VkQ7o1s0oEf8vljL1lU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwE2PtYwDp7F0v2Be7COdSywpQpyHc311txpIrS8hk8AGOuBpgf
	rxpieoY6WEAY9h1v6RxOEcQIDACmKom0OwKMFMh1PhToT1lOmHQCvJ1mPIrTEs5NKRIJ2ue/DzZ
	3ifqYtzW6n7GFX5gzNIwRSDxiDqjtrDY=
X-Gm-Gg: AR+sD12UAXOjXQi2xy7zQ/kIaO5l2/1onN0rCwN6ArlAC+b0Ff2/e7HrnBOkM5dqRCF
	+CV7xOQO9kEqlPilGOe2GOdWa1R7z/mjPdCOIemaetdJy3g1s2UIPW/0Eax/f4ywrFdU6ToWc3r
	9dlSMciyfkdEbB8DhFhYavHE1kfVBBFFv9fwIMlv3OEPZTg5fxPD0nxPDHlhGu7u3akMITNQtUQ
	fO566Zl8a8ZkMK4zVbHHRss4CRyl8a/BJCx3wTFVeXzzT3dkXUnwnoeWrD7jHJDnxCqhi99sge4
	10gI+qGPePzuuFm0dmuz7fiodVEQRAqA4eYwxmOUatnLloP1Y10MYw0GNnY2CwywHpz3WAjMwDv
	Orn2oXqDNUBez5L3IJyF6p3lNNVHIZVhjZ5GogEQ8Pw6uWQXXmqIxQ1rRGceNNVqDM9t0uSTpqS
	Fzunm1d3rWDPRlea1QqmUe+REq5rXaZ64pd/+w
X-Received: by 2002:a05:6102:c10:b0:75f:e517:ec96 with SMTP id
 ada2fe7eead31-760e3194fc4mr6510269137.0.1786141963578; Fri, 07 Aug 2026
 15:32:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260806-submit-mdio-of-dynamic-v2-v4-0-4beb0c50d5ba@gmail.com>
 <b2e83ba0-2e9c-4105-b806-8a155e8b9aa5@lunn.ch> <CADvTj4rame1n8eQL2GUOaJHnOcR_cqNxzNYO+QeCLYDczEFeUA@mail.gmail.com>
 <ddce5cfa-8cf9-4f9e-ab0a-0b415706876a@lunn.ch> <CADvTj4qxGVw+PW2LeF-a3h1XfmirQZGfJA9-6Czt72XASbVLBQ@mail.gmail.com>
 <4aeebecb-81fe-4f09-9dfe-a3be2f778bb8@lunn.ch> <CADvTj4qrYYA-e+9iJ+q4UaZteUjpypRa6HBSmwp-ajwPbwYERg@mail.gmail.com>
 <3cd188e7-7dc4-4d67-82de-e2ef3edee232@lunn.ch> <CADvTj4pJG56UERve8BfbYzjCLO4KBDDuFviTcz1ivuwUFRMdxA@mail.gmail.com>
 <e0ed0a61-8878-46e8-805f-c0869b97da7d@lunn.ch>
In-Reply-To: <e0ed0a61-8878-46e8-805f-c0869b97da7d@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 7 Aug 2026 16:32:32 -0600
X-Gm-Features: AUfX_mxyCMJ9oLuM4JTN6om3edbz324m6hnUZwCI6mNxVQPiU_32JZeN9SnoDtk
Message-ID: <CADvTj4rq2+scjiG8Uf771Q9ykhqDCFbAmNgNbHedyUteW-A0Jw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 0/4] net: mdio: support dynamic OF device changes
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Richard Cochran <richardcochran@gmail.com>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Jonas Gorski <jonas.gorski@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Ciprian Regus <ciprian.regus@analog.com>, 
	Andreas Larsson <andreas@gaisler.com>, Mark Einon <mark.einon@gmail.com>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
	Keyur Chudgar <keyur@os.amperecomputing.com>, Michael Chan <michael.chan@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Wei Fang <wei.fang@nxp.com>, 
	Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, 
	Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Timur Tabi <timur@kernel.org>, 
	nic_swsd@realtek.com, Byungho An <bh74.an@samsung.com>, 
	Steve Glendinning <steve.glendinning@shawell.net>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, 
	Thangaraj Samynathan <Thangaraj.S@microchip.com>, Sebastian Reichel <sre@kernel.org>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 2:26=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > So should I just drop the final "net: mdio: support dynamic OF device
> > changes" patch and keep the MDIO hardening patches?
>
> If you can provide suitable commit messages which indicate you are
> fixing real problems.

I guess I'm just trying to figure out if mdio map hotplug safety is somethi=
ng
that's considered to be a real issue or not when most existing drivers tend
to sidestep the safety issues.

If OF_DYNAMIC is something that will eventually be supported for mdio
then this is something that will be needed eventually anyways.

> We get way too many AI generated patches which
> fix theoretical issues which nobody ever encounters.

I did hit it in practice with my original series so I used that for validat=
ing
the fixes, however my later revisions use a different design that uses
phy_package instead of a separate ctrl driver which avoids the need
for OF_DYNAMIC support for mdio.

> That is wasting a
> lot of Reviewer time, preventing me and other reviewers from helping
> developers doing real work adding new hardware support, or fixing bugs
> which both them.

So to me it seems like hotplug safety for the mdio api is mostly an API
footgun at the moment if anything for existing drivers, so I figured since
I already had done a lot of the work refactoring it to be safer that I shou=
ld
then submit that upstream anyways.

Most of my embedded Linux designs heavily incorporate different
hardware autodetection/autoconfiguration techniques which is probably
one reason I like the idea of making more use of the OF_DYNAMIC
feature where feasible for the kernel.

> Those are the people which i prefer to help, not the
> newbies using AI and have never taken Operating Systems 101.

I'm certainly not a newbie[0] but I have been using AI workflows quite
extensively as AI greatly increases the speed at which I can iterate on
patches as well as significantly increasing code quality.

In general I run all my patches through many rounds of AI review before
submitting as well to try and reduce the amount of bugs and such in
addition to my own manual review.

Whether or not to preemptively refactor code like this mdio code is kind
of a personal preference however so it's not always clear to me whether
or not it's something I should be submitting fixes for upstream.

Maybe incorporating AI tools more in your own workflows can help with
keeping maintainer workload manageable? I certainly use AI a lot when
reviewing code from other developers.

[0] https://lore.kernel.org/all/?q=3Djames.hilliard1@gmail.com

>
>        Andrew
>
