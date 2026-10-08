Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E983A380C
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 16:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791477748; cv=none; b=BX9bjHJhhKNZR4Xe82GJ47CdjlvnyWLyqhw17gzC2OqY7VM9ORIMxAZtTpcU6rWWQpjZPqBv4sT+G6I6IarTMff1ROoF0+WKC94epep92Y5x64SdRF4zG3ke7rKeO90adGg073FQ91SFOB+/tA+af7rLtWQ3nq841ZAXGLv6Njs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791477748; c=relaxed/simple;
	bh=7mvuGWTaFOWJp1wnSmxCGFTK8yaJ6uwg08XxlyeCyKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l0PFCTe2y1phJXHUmGgdmO4qqDuw3KdOsUoeNiSLGLPNw/gYfMI+uskHWurqUooJnCyw2ScS3tBNqtqqGgxp/ojNiKCQos0H02O3T1JSR4PiFCLVcpeid6kKJ34OCH2PhmbKd1nDfHRGhbQmNFeV6zmIDIj8TFXZGcn5A9L418E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=iEZgnBHl; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="iEZgnBHl"
Received: from eahariha-devbox.5bhznamrcrmeznzvghz2s0u2eh.xx.internal.cloudapp.net (unknown [20.114.54.184])
	by linux.microsoft.com (Postfix) with ESMTPSA id 25BB820B7166;
	Thu,  8 Oct 2026 09:41:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 25BB820B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1791477690;
	bh=RrdGR8+5+7JD9zLubC3R5Nrwx3f6rQnHI7MHAeeFjZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iEZgnBHlg1T1yn8CZKhtuBx45f1+HQol4iZG3iM7TQiQXiFIlmf21T9mvH4xgbgRy
	 qUB/J1fkHFphCRL55R8CWqDa4i5ZPlrg3EWE4PLqdRgqrJtOfmoZ39QDPhyiFLR0uK
	 JIx2GA3l12I4vaoXbAFUVMUa5oGTMjpbEw8yJcIw=
From: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
To: jeffbarnes@linux.microsoft.com
Cc: Frank.li@oss.nxp.com,
	Zhiqiang.Hou@nxp.com,
	bhelgaas@google.com,
	imx@lists.linux.dev,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	minghuan.Lian@nxp.com,
	mingkai.hu@nxp.com,
	robh@kernel.org,
	roy.zang@nxp.com,
	Easwar Hariharan <easwar.hariharan@linux.microsoft.com>
Subject: [PATCH v2] Revert "PCI: layerscape: Change default error response behavior"
Date: Thu,  8 Oct 2026 16:42:02 +0000
Message-ID: <20261008164202.64477-1-easwar.hariharan@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
References: <20261001153323.1965074-1-jeffbarnes@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

> This reverts commit 84d897d69938
> ("PCI: layerscape: Change default error response behavior").
> 
> The Layerscape PCIe driver programs the DesignWare
> AMBA_ERROR_RESPONSE_DEFAULT register at offset 0x8d0 with 0x9401.
> 
> For AXI, the documented default with AMBA_ERROR_RESPONSE_GLOBAL cleared
> returns OKAY with all-ones data for errors on non-posted requests.
> Setting AMBA_ERROR_RESPONSE_GLOBAL causes an AXI error response instead,
> with AMBA_ERROR_RESPONSE_MAP selecting SLVERR or DECERR for individual
> PCIe completion errors.
> 
> The value 0x9401 sets AMBA_ERROR_RESPONSE_GLOBAL and maps Unsupported
> Request, Completer Abort, and Completion Timeout to SLVERR.
> 
> A PCI configuration access can race with the link going down after
> dw_pcie_other_conf_map_bus() checks the link but before
> pci_generic_config_read() performs the MMIO access. If the transaction
> results in a Completion Timeout, the Layerscape error response setting
> propagates it to AXI as SLVERR, resulting in an asynchronous SError and
> kernel panic.
> 

Could you bring back the kernel panic backtrace from v1?

With that,

Reviewed-by: Easwar Hariharan <easwar.hariharan@linux.microsoft.com>

> Reproduce the race by obtaining the configuration-space mapping while
> the link is up, then disabling the link from another CPU immediately
> before performing the MMIO configuration read.
> 
> With the error response override enabled, the overlapping configuration
> read results in an asynchronous SError and kernel panic. With the
> DesignWare default behavior restored, the same test returns 0xffffffff.
> AER reports a non-fatal Completion Timeout, and no SError or kernel
> panic occurs.
> 
> Restore the documented DesignWare default error response behavior so a
> failed non-posted PCIe transaction does not become a fatal AXI error.
> 
> Fixes: 84d897d69938 ("PCI: layerscape: Change default error response behavior")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jeff Barnes <jeffbarnes@linux.microsoft.com>
> 
> Changes in v2:
> - Change the subject to identify this as a revert, as requested by
>   Frank Li.
> - Document the DesignWare AMBA_ERROR_RESPONSE_DEFAULT behavior and
>   decode the 0x9401 setting used by Layerscape.
> - Clarify that the setting propagates Completion Timeout as AXI SLVERR
>   rather than causing the underlying PCIe transaction failure.
>
> ---
> drivers/pci/controller/dwc/pci-layerscape.c | 12 ------------
> 1 file changed, 12 deletions(-)
