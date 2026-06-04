Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF210466B7B
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780576461; cv=none; b=T3DymgTG2YMFaMe6cNdDNDrhH0y9+Ir8X4DRsXnGTKm/a3qaIZlfcCdYFdcDMvwRZ2Jt6N3cTa2AhXTzj9YqzIbyQPqLAwIsHfbMlZtva++OrZ9ll1g87K5KluRTjVYSKNQvt5CEXAOAHqTrZ6hf1jHoNx2+/bcb5ash6hXHD+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780576461; c=relaxed/simple;
	bh=tRdKfjnRUz0aPl6PAEFjMNJL5WVJkUOwzH0txEdO+/Q=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UedlQ0aJ9HDgX3w0PwKEcZgAh2VZ6MwKAk3z2Oja2L38AHEfUIcjlqkmkSKDtc+VeZ0BYhsawVJVDP8WiTZ0GpgnOEtgR0l1JA7lCuZ0VGxIykCfQzthE+9Ze3ghF9gThlKFvqaF4rJFLb+4YbUCbmQnDU+AA8NQguinD/D3V8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SGUj0Tum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SGUj0Tum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6361C1F00899
	for <imx@lists.linux.dev>; Thu,  4 Jun 2026 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780576460;
	bh=kQ6M6FDKXPf9y7Y2G+ZlFRRaP5oLHz23vLbG+bNrvo8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=SGUj0TumCbHqZvwuU5fyes/HNZrO2+nogA3Tkdr9yq9y/lB0O6K8blBDMO9qw5Qu0
	 jCViFY/L50VFeIwFCNTSCG3OmeIVM/oWXT3Yflte2ZWdS2v1BVJeaWFNdODaAO2Hnc
	 8CLjhuJ6Poehf7D4B87UsMhPvdVpYJo4S8KqBH6bq4ZZxuUvhz4gvRi4Luaq/PLyoC
	 hHdkfuD8LhJqDiy8wHZPmvzw79H77qq6H6R7Am8IrsQCQS7as+oAO8rO64zsrqL5lk
	 e120aiZv8Rj2RC2EAzTJDBJKhPAYC6IDSC3hkoNnPQLHv1qFrktURbWcZHZdmzIegf
	 1aPoMgAIgjPRg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-396bed274b9so5721931fa.0
        for <imx@lists.linux.dev>; Thu, 04 Jun 2026 05:34:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Qdi7t0sS4Rv9GllQw9NlDVYQCj5LrnlUjCQ9bfAqiutZAU+suEX39kzsM9Wc8I2BfRdc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyis+jD2xvZFyIbxBYRum8iUjeYOtYmo+GLZm0E67rZldhq+XBP
	Y4SSDXKZtGcqLMjWX5phsxUVxipC5LiEMFE3NVvGiD+t2YcpAe/YwiMvoqWby8Uuu9oLofsq3pl
	5HE9LIr+XtYJw7R0nzOufEUx6jatBN5cROuq9yxMDrA==
X-Received: by 2002:a2e:bcc1:0:b0:396:8eb1:a4a4 with SMTP id
 38308e7fff4ca-396af436443mr25706941fa.14.1780576458112; Thu, 04 Jun 2026
 05:34:18 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:34:16 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 4 Jun 2026 08:34:16 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <ah9P6Xt9SyKgc2oJ@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
 <20260521-pdev-fwnode-ref-v1-20-88c324a1b8d2@oss.qualcomm.com> <ah9P6Xt9SyKgc2oJ@ashevche-desk.local>
Date: Thu, 4 Jun 2026 08:34:16 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdhjZhGL9tEx9WEjn2f95d=ObNM0AtBNpcevm6aHgpj+Q@mail.gmail.com>
X-Gm-Features: AVHnY4IaL6Srer7kIaxoyyrYpvf7EUQjky2qCo2_J16coVWA1ajpEEsVM7UfQA8
Message-ID: <CAMRc=MdhjZhGL9tEx9WEjn2f95d=ObNM0AtBNpcevm6aHgpj+Q@mail.gmail.com>
Subject: Re: [PATCH 20/23] usb: chipidea: use platform_device_set_of_node_from_dev()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, 
	Thierry Reding <thierry.reding@avionic-design.de>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ulf Hansson <ulfh@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Peter Chen <peter.chen@kernel.org>, 
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, brgl@kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	driver-core@lists.linux.dev, devicetree@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, 
	iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org, 
	linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 23:49:29 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Thu, May 21, 2026 at 10:36:43AM +0200, Bartosz Golaszewski wrote:
>> Ahead of reworking the reference counting logic for platform devices,
>> encapsulate the assignment of the OF node from another device for
>> dynamically allocated platform devices with the provided helper.
>
> ...
>
>>  	pdev->dev.parent = dev;
>> -	device_set_of_node_from_dev(&pdev->dev, dev);
>> +	platform_device_set_of_node_from_dev(pdev, dev);
>
> Why do they even do that? Do they have a USB connected pin control?
>

I don't know. I can't test it so I don't want to break it. If they don't need
it, the person who can test it, can remove it later.

Bart
