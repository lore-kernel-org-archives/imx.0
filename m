Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 121B940E8CD
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 15:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612620; cv=none; b=q3naXabuEE+eFLL8/VYN+wqtDCogJAFpLnsGqGxvg4qeUvO2C3bFtBNdzP55gN9aTd8oNlrCqWKu93XNNaEa46HZBkhjtQOWsko+BlHLxae4CFb08QUrtUpl6K5CL5BJ2lrb6fM6iTbmr1i2ga5j9z7lrkhPKbhnLue68uRF4uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612620; c=relaxed/simple;
	bh=sjgNbZiV3++Z4UN8HNJiQC5nIdx6epyEHbUAC/0BMLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6xJOTjUPwQBH5zNNQ2v99yxXOE8YXPVfDmadlaev24XVTeqV/Vl+9xO0e3hlm7lNw4KgJLVtGH7MiLloCrDpfVeVBOAtZShv+EN/09CnF+etkkV3beZXR0rknFHMku5j1ZLPosELJSgE48s05mMvjO2lTYuXS55YI3Y4/i+N78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VED7tvbD; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VED7tvbD"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 902453591;
	Thu,  9 Jul 2026 08:56:52 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64D453FC81;
	Thu,  9 Jul 2026 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783612616; bh=sjgNbZiV3++Z4UN8HNJiQC5nIdx6epyEHbUAC/0BMLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VED7tvbDPPrhJTTi0A5BLW27z4tBMG6VuVYh25QB3mdOaHqHwgmtwxJQBND0reMTL
	 b30AiBYj3rif3WZBvDJJbmYjdovHVSzaGzCw9IS7U+gWcmf3GvWvbL9bBErD6qERuu
	 nbZM2C3vax+2PA545dIrPoYJZXhx4/0yzg2s/RHc=
Date: Thu, 9 Jul 2026 16:56:43 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	vincent.guittot@linaro.org, Souvik.Chakravarty@arm.com,
	Alex Shi <alexs@kernel.org>, Andy Shevchenko <andy@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <dlechner@baylibre.com>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Len Brown <lenb@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	linux-arm-kernel@lists.infradead.org,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
	"open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
Message-ID: <ak_Eu_eQKalPMwo-@pluto>
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>

On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> On heterogenious systems like AMD/Xilinx FPGA there is a need to talk to
> SCMI server from different architectures than ARM that's why remove
> ARM/ARM64 Kconfig dependency with also remove ARM from description and
> rename folder to reflect it.

While I understand dropping the dependency on ARM (I always wanted to do
that and test if it worked at all on some otehr archs with QEMU), I am
not sure about the whole renaming party ? why is needed just for
cosmetic reasons ? it is at the end an arm originated protocol so I dont
see it as a being wrong to be named as such even though used by other
archs...I have not really strong opinion on this...

... my concern really is ... wont this full scale rename simply generate
a lot of un-needed churn for future fixes and/or backporting ?

Thanks,
Cristian
