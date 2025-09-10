Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0D623E335
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757493942; cv=none; b=kWpGYGWeX7MrzbYmp4EqvJ6l6qMEPLAK6rHGUkVHWsVEkt8yLgDHAIuZ0sH/9porG9Rfa05S8DyugxH/M7zqE4/WfMJwy1ybXte0WWJOhHZLG3G8tCejLuo+y9plgrFjlLWa3Qsl7ruW/LgkjjGAnz2pgNcXnwb484XQWrcR1Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757493942; c=relaxed/simple;
	bh=b30MO4zp9p/RKhKI6RZvaV69XNrXjRj73xkh/4Xi8jM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGjmqrkC+tl4UXFLFpbpac/S2RJA/ldcKA2EwqGOoei3OB3jDSF3D3Fa4QrenR9kvLM4rQCTF+J7x0m3zgrkaq9av13X0EBrOxGZyeQUHN+QkaZM73Zxb9Rmz/IsiY3iuWZNfQFPM3mZXmrBpbNopijDySWRxJ8fw9ac7/AU8Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=TTC97Rhn; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="TTC97Rhn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ZfdHANOehTUP1HPo2Io2Zx+Al3fFDMd7EV9Pa2pY7UU=;
	b=TTC97RhnEgJfdlDzGW47lqFtg2e6cVlsSCFfrsS/oXpiK2FMEG2qNi5T/ibO0f
	vlpeixtVmt1bFDP4BvEV0nNZDFTnVMZhDOA/n2fPXrb7JnyIKu8wBGBocSMbxJwL
	sE+NWsgAtsE0QI2yAAAtP0WKCTHAT8Tu4r4IigBUOgd8k=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnJW+NN8FoDMs8BA--.39270S3;
	Wed, 10 Sep 2025 16:32:16 +0800 (CST)
Date: Wed, 10 Sep 2025 16:32:13 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank.Li@nxp.com
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Shuah Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org,
	jdmason@kudzu.us, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kselftest@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v21 9/9] arm64: dts: imx95: Add msi-map for pci-ep device
Message-ID: <aME3jbmlRVcT2biX@dragon>
References: <20250710-ep-msi-v21-0-57683fc7fb25@nxp.com>
 <20250710-ep-msi-v21-9-57683fc7fb25@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710-ep-msi-v21-9-57683fc7fb25@nxp.com>
X-CM-TRANSID:M88vCgBnJW+NN8FoDMs8BA--.39270S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU8zVbUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhB84WjBN5DjOQAA37

On Thu, Jul 10, 2025 at 03:13:55PM -0400, Frank Li via B4 Relay wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Add msi-map for pci-ep device.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

