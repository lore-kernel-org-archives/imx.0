Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9751838F223
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 12:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770294622; cv=none; b=AiMmq0RGvRIDPx9sIqvBNu9aHx5SY/zdVEhFyY7cfI032iY5C6NmOXaw/hXfKTwy82F0+TNPhyAW/1MA4xcLUicTREipi7+Tsh2hCAg5I1JMR1BQNg1prcdPGpl+Cv4J+e6UlgJLAulob3Vb8k9+Fs5cPPnj79NaDuTra6oMmiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770294622; c=relaxed/simple;
	bh=e8MY+EqhN2Bw1t1vOGzCgEmWAD0c9+fT2885jbPp00g=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=abU9WxsYUfQn5c5a71MAL1x+kWfozApJI6S3xhjOMKHu72VWGv3Aw28q5PT48EMftsu6xaCAZ9KqAbf0cBx06S9R8gns2dgY+/P4WDupHbvjrujynU2GwDserEaXZQtbgV5D2Xo9YoyBFYq9GYLz2W9DTe8grouXkgBzXhwzzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=SOeoAv+D; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="SOeoAv+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1770294614; x=1770899414; i=markus.elfring@web.de;
	bh=e8MY+EqhN2Bw1t1vOGzCgEmWAD0c9+fT2885jbPp00g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SOeoAv+DFg3pE4D35FMptZo+zd/UEyxKTqRor5eD3Pxjm05JjwGCEmst/lYC9lmb
	 dX79ok5MCP7tKWhpI85bKtvfE5uP6nxJr5VwBbGL16sjEKSWKtwHNkrz+stUmpqe9
	 MxPeY6NQhMrlx91eEl/7bfDEya7Fs5QY+8Ea5cwwnI0wevByCUC073BcOZA60mrZ1
	 zf4K39JUGHFd1/cR8PVsagtjCCjmNYuyGf20VXU/R+VdYE7MOjEigcQp8BVVXHx29
	 N7FB60wk+YGPKOA7vXRCeqGfpYnME9oEcMeRGzPSIpxb7DJiAsgQWLHAl8GoXNeiF
	 4eVlM//PP1kkEPYDbA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.222]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M59jC-1vms2E1dUi-00BObX; Thu, 05
 Feb 2026 13:30:14 +0100
Message-ID: <fb5e20b7-b858-4099-ad8b-900c367e1b22@web.de>
Date: Thu, 5 Feb 2026 13:30:11 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, imx@lists.linux.dev, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260205034219.2531280-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] reset: imx7: Check return value of regmap_attach_dev() in
 imx7_reset_probe()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260205034219.2531280-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PfbH0ePR8jK7BGnIuAZJhnTGzjgbXR4PrPdABj0tm2W+1xf9xE/
 fNfWe+mUu+DMRElNXf5f1Yde3CqXPTNXDpfkaNAHXsfxa8BaZR0SCy/81TkI/LskBXeLDHy
 PSUfTc3w3e/QiZzKUohMRw7kNXa2y0CBdI/9UmzSxfdFbpvtpCyDmdy0blfImD4cA6C7XzW
 EaU6XXEI0hxpbFhmC2GZA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7Uc3oTaCkqU=;i8/9JUXNmUoHSCMHMrhG3iuKBLt
 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

> Add error checking for regmap_attach_dev() call in imx7_reset_probe()
> function to ensure proper error propagation.
=E2=80=A6

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
