Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA471FCFF0
	for <imx@lists.linux.dev>; Fri, 13 Jun 2025 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830307; cv=none; b=gxgbaGatlbM8KIj+QzX8TEZQtNMrbJH/wO8bLC8xB8CSDZw7ZkPOv3qsI0piovBkMpOZiX5AbmLEtQaPrRZhV4OfBaczngemD2tzAu+HU7XMwrf+HF+RaMzgoxKwrwpsoAvDgv2wSRsbKq/buRgCTFtDW6uBjnFO7Ap6OIWEDo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830307; c=relaxed/simple;
	bh=cGUKaP6dgfpeo+RKTZCV94jyFa+uREbM3iubZvhap0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AERuzSMFxAo1Ox0A/jVGt+7XeGyNLIc4xlduXzeSeQyu3GmC9MwOwXzRoeFVQhnrPCHCxvfdAR8M0bb6sgdgrypOO9sBV9s3p/Bn319t9oevVPZV65cHm2DhRYnX0xdk1FGCPh3ztdwvuAEDj+LXRNr0TWotB3afeel6PX3y5wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HBU1XVFP; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBU1XVFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749830306; x=1781366306;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cGUKaP6dgfpeo+RKTZCV94jyFa+uREbM3iubZvhap0M=;
  b=HBU1XVFPV8XhW42dZkmcid3Y0fWN/0j9SeK71+te33TWDYhnSy0SJEkx
   yziElKiJo+AodNE2q3cnT3KKkGLuuqGxoEbd9IR+NOCrGp4UESlKosLc8
   SBT5+xQHtHMXt/HV+eg9pIHNpyXwIgR9GgIEKKz69dZR3gNUk1xf1uvEU
   hW+OWCMrIv6ShL8PKJlq5NUNtB31bH2JBAKTSfK8Zowu7P4ZxSe7b2jLL
   4i33B6VuWwZeXEN2bfkSQRqC1/GLv+o2NUHv4vSkIuCE6UbRLx+GGV7FB
   8b6OrF/qK+hAj/od6fQRR70lL0WEH4esGsHuLPiEtEiVN3F88N5UWmKm4
   A==;
X-CSE-ConnectionGUID: b3p4dT50RiOuTN98sDLUEA==
X-CSE-MsgGUID: PcT1BU+zTYOgWbrUAyc0Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63403150"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="63403150"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:58:25 -0700
X-CSE-ConnectionGUID: ZNpjhcVcQvCbGVVMZUTnnQ==
X-CSE-MsgGUID: Q3OrfPCuRPKKipwCiTZe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="147743732"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.111.232]) ([10.125.111.232])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 08:58:19 -0700
Message-ID: <4fed7722-d0f7-4bde-a06b-a003718651ea@intel.com>
Date: Fri, 13 Jun 2025 08:58:17 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/28] cxl/test: Use fw_devlink_set_device()
To: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Peter Rosin <peda@axentia.se>, Derek Kiernan <derek.kiernan@amd.com>,
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
 Len Brown <lenb@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Wolfram Sang <wsa@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Steen Hegelund <steen.hegelund@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250613134817.681832-1-herve.codina@bootlin.com>
 <20250613134817.681832-11-herve.codina@bootlin.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20250613134817.681832-11-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/13/25 6:47 AM, Herve Codina wrote:
> The code set directly fwnode.dev field.
> 
> Use the dedicated fw_devlink_set_device() helper to perform this
> operation.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>
> ---
>  tools/testing/cxl/test/cxl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/cxl/test/cxl.c b/tools/testing/cxl/test/cxl.c
> index 1db7732a70df..80e6fb3c9a43 100644
> --- a/tools/testing/cxl/test/cxl.c
> +++ b/tools/testing/cxl/test/cxl.c
> @@ -1047,7 +1047,7 @@ static void mock_companion(struct acpi_device *adev, struct device *dev)
>  	device_initialize(&adev->dev);
>  	fwnode_init(&adev->fwnode, NULL);
>  	device_set_node(dev, &adev->fwnode);
> -	adev->fwnode.dev = dev;
> +	fw_devlink_set_device(&adev->fwnode, dev);
>  }
>  
>  #ifndef SZ_64G

