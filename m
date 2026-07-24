Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA9431A32
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 12:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784896675; cv=pass; b=EMr+scmWnpDAnGI5tFuyEQ57hSNsMoXNpfC5eE+RNIlJsRk2l7OF0c8Z7SaB2176lCt6gzbStu6tBbKWTTY6UV+M/DWDuxOvVoGGroPPPFi80/PpbmQuaCnBQagdGOW485dxMH9cmgL/H1wt9d3CiqUXvyaZHVTYuJrcKRVp7vw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784896675; c=relaxed/simple;
	bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wg/3h0p5Ul/agT6a3O5g9HZAQ0QH5auhk8tjXXMO2eDtE4mHllga2Ymmkw3+CA9zFfznElpwWeLQSc4HAatTu0UXt1noEsHfASFfUiITawSjCgNZtPCdrBZbZTi7f+ZteFin8LurAkLBuV76P5LzwhNVj3EvmzHtGhfWQuSrejQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DuO4BGJM; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DuO4BGJM"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5b2aab18795so364440e87.2
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 05:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784896672; cv=none;
        d=google.com; s=arc-20260327;
        b=TNcqLYHgoKRsL6XhKqaopHhzlPkfKYLHwCDWm+DZ71Rc1sLMYaIPND/MauNJX0rcdb
         xDXtsd6EtvFqebjgN0hBMNF3AAKO45Bv1Uh//NRthUNLHKiikaUyJIRddWLUqsmEWX2Z
         LTYUAernk0FsFVQ1HjllsZajc2ip/JLhBJ37uiTqVTR0UPyqBNM+CoiauzY0Hc0KpbTe
         sAhE8Uh5BkBPiEUHpx4kH32lx4ZzV4sMruLcC2kLltKRXMyuFqSd3B2xzN0R7HQp6hwX
         ogva2H99kfkk8OLBIA+POEvCSwpWfKyWiKkp8pNuEPJwf2lhp/semf3BFRrHfAJhxRua
         eKhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        fh=nBWQnJgiTubcJPw2SHOTgPmFkqkS231Bf/dPsPTKtVk=;
        b=pqZ6u2eq5/+Vardzu5Z7W6uNJ8mqFyQOJ0ZfcgJvb+TTs0foHcJTy1x72WLqoj4XZV
         RPZV8Pw1deV376ZxVAkLeF2NWf/0plQxYjr3tAQR1UZranqUjWTeJa5hJfe+cz7eLjtA
         Ipvf+sRr3WvpVC0jcxqyYw9XyqxE1sfjRIK78yhCYrE2cOVEPexyT8JXXkC9qWCI4HK/
         a+GdeWubRvaS+jYchgVw0480u0HyQwRSGvGL+A5sb8UIt7ZYhbsSbXJwx2YgoJJdoddf
         v91FZMwL7XapHB0KKagWF+LTEbDQL+OXaiHtytZmUt8OyTfNv70tx3fNou/Y4DUPse13
         UUlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784896672; x=1785501472; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        b=DuO4BGJMSo5gdMltKuHrpqfsZkAYKUbzXp199EHe07ZY+9ex9HlYZqB959eIlZM0j9
         KRoWy7vjqf2RY279s9P0zt3QeUrlfz+AvNZQ7gk4o9oLTIWQdmm4DhKhuss5dnx9w3rh
         xq1Awe1V1yC3cGeTCFWXBChE6r/sPMjwbRhtmYfwmPl6T3UeY5axoo0j6t+ZE6EkoPzV
         T9QcLhZZcKbWjsVxDXBU/vgH6HQhiIfF/I3zj7UguPGBz2rGj78/RYPkjY4wryH+pQ8/
         d12Jbz2sAB3H5vtR2H5mMIiQml6BN18NbbmvrpmodXM+A2ZRD4T96Ne7/27FwmiybXhR
         cz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896672; x=1785501472;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vEXE20UjUW8jHA9L8lniOLjS5XVJAtQYjXALCmuoPVQ=;
        b=Hdg1bTgjBHv6lOF8Jco7GlPUmSX4yz2jb6/RCJYLeYvdomNHO091hgwTVBGbzCMaVx
         N3lJQXFGWTMYflzFnhWJJMAU7nEevx9fk4evMvRidChJbp6ArWd/7C0Xz9U7Nw7TVsPF
         R2CLcPhMiPAqynK1hoRh3UWM9q+XluAZPBaBZvddIcU7mKfG17NONsFMXTRzQGHiNpOH
         BYHG9Mg+6tMxOQwizjKXM9wBBXfGElT0lLm31UaLF34AF0SoYbLE1+G7hnfGq2Kr9NCI
         ahclQ82kfdp+Rmk628vPg6vLYa4KrwXZyFoIgBqm9YHril9f7RVyyeF6Oy4/PPb89v+c
         2dzw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/uFY/H8HkPpDHbvY7hvrp+6jhXh7C65Pfw3/QG4s4ASP3M4b8IzQZ5ybUJFTGQVSMVos=@lists.linux.dev
X-Gm-Message-State: AOJu0Yynh6ZVQ8pny/2tg5sAsCOuefPKs1lkIKGE+4PThzPumaPgh2rP
	lCim9GUzHiG9bpl+ApnHkTX69lYzcwk/JN/zeNABJ0sWEh6Nx5KV65f1jsBfuvv1ttwhn+/rpf7
	ujSna7TbEaASF+mjTbqLON+llhag2k6Q=
X-Gm-Gg: AR+sD11tfTkJChHzPRXsO38wH44fsJYckBQTbeEfJoXfhXvl3qf2tjkt0dek5YRvD0d
	DprXnn6fWY08jYbSe52M3QNN5kRkpJyhnFwaN0iIS3xyrqK8XQ9ly9erl8vOggskzx+f8F1c0Xw
	4mcxBEpL96tkKwm1mj0Sc/UpUlr9V0dPhLsyZuysNe79J688vkzLr16swRS0WZJWGBzek1xVFTu
	DhE78f0zzxvl6KgRVTGOvlkyKc1oZdDyuZHU3xE2gIqARFFWLH5sCk3inWWEXfOCfMqKBQnxJMZ
	yxsBkeIT0gch7u0Pxh1F/ox0W9+oeaDPeeKuZdUyjCWM/t8MM0E=
X-Received: by 2002:ac2:53b6:0:b0:5b2:b004:ab9d with SMTP id
 2adb3069b0e04-5b2b2f6a707mr1282684e87.34.1784896671507; Fri, 24 Jul 2026
 05:37:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260724103212.41821-1-stefano.r@variscite.com>
In-Reply-To: <20260724103212.41821-1-stefano.r@variscite.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 24 Jul 2026 09:37:39 -0300
X-Gm-Features: AUfX_mwgknCi6WlphIv37dVpUoZ2x-w1U5-YTUZhiBpTOvf3BDpn5nA4L3y60I4
Message-ID: <CAOMZO5CkN4DidYgfMqMUuZ6mKC7VPR4Rq_Ux0kvcK0t8HhgqOA@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band
 status for SFP
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	pierluigi.p@variscite.com, Stefano Radaelli <stefano.r@variscite.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

On Fri, Jul 24, 2026 at 7:32=E2=80=AFAM Stefano Radaelli
<stefano.radaelli21@gmail.com> wrote:
>
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> The 10GBASE-R port is connected to an SFP cage and requires in-band
> status handling for link state reporting.
>
> Set managed to "in-band-status" so phylink can manage the SFP link
> through the PCS.
>
> Tested-by: Stefano Radaelli <stefano.r@variscite.com>
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>

There is no need to add your Tested-by tag to your own patch. Please drop i=
t.
