Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAA522489B
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 11:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745242; cv=none; b=jNGXQmSI4oj+CSykWmhGdeN7PVqj0jGJw/IO6rOvN0+CWuVdMks56vSC0OuPMAFMNNx/mYtRdtVia7eGfCBbEa2QiWBnKsIdnJnSy6V9S4BWSQ7Fm1XFuuK4IlInJW3E1CPpmKsDl0VQN5ch+4oM/Q4cdc0B8UXiPRlaGtyZDCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745242; c=relaxed/simple;
	bh=vKgDQVSCZiZVuUoe460Wv+0RAgKUSRH1hgoxUMIGfZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMkJipVR+cnYrZsDKdge6knO2Bd3TgTpgmu+WPTFw1LEuFnBF+cf91noj8Kfqy095IPW+/7o3CzLJRlql81qmpkCN4DbBL4bf1jN/qpSYzblHOap5FiIv3Q7hpXgMR1PnAHtOaH12YgBU0okgPJx73yFUUJdSQXcixM2bT3qbpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=Pr8+lrlu; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="Pr8+lrlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LIpz7GLi/1VprLwmkdntmiNTbEeJvdJjxSq1eWwxCQo=;
	b=Pr8+lrlueEgW16+Qc/mVD55zRoidCDKiv6WEF7aoZ3vM7mmkRrl91QI0NFb/s4
	NpeZ765DFVmE+0bBHaMJ9WLDaYh88fq0lcJTZFhiYnReJIHR4ic92Gqxmi2R+5IZ
	DgtXGxcqKOFRhpHYbUISnC9SnB13IquQE44qCVzJrXIow=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnTOBH2lZn+byPBA--.47585S3;
	Mon, 09 Dec 2024 19:53:45 +0800 (CST)
Date: Mon, 9 Dec 2024 19:53:42 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx93-9x9-qsb: add temp-sensor
 nxp,p3t1085
Message-ID: <Z1baRpmr4MvsU0NQ@dragon>
References: <20241112-p3t1085-v4-0-a1334314b1e6@nxp.com>
 <20241112-p3t1085-v4-3-a1334314b1e6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112-p3t1085-v4-3-a1334314b1e6@nxp.com>
X-CM-TRANSID:Ms8vCgCnTOBH2lZn+byPBA--.47585S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUVdgAUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEQiwZWdWofLmhQAAsN

On Tue, Nov 12, 2024 at 11:52:01AM -0500, Frank Li wrote:
> Add temp-sensor nxp,p3t1085 for imx93-9x9-qsb boards.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

