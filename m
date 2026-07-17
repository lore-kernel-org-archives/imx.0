Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5F632E128
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 08:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276474; cv=none; b=MSk2btjNHBBzrqjpu1RRvxrWo5L4i4Dgh1gD52JD+eTAo0Z9cXWmiMNgHqcAKNXd1pRYKNu6hSvEoxbtqi6rH3NH0t8hH8Os1lQ7ldJz9+5ddOILjK9esc62ul0oVC7700W3GrrDArX+V7YgDcBfku61h4z5KjoOK5/vQ2i5iQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276474; c=relaxed/simple;
	bh=GbB/VKmKrO0bVvKbM+2E6G5qtiIuFuhguFIXPM5nHJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XQJf9GUKmv42IwKLsdeVWlKykrOXYOd9A9BDP1X/ZByadsBU7pDD6p6umGi2XpKsxK6KDfH57P144jrlCf52WYuk3qC8maADZ4Fox/0Xee6FG2jkdPwQ6qKrT0EjjoS71gqXlFmIryOztDqHkU39W/lWqz8iJEkeYuK5nkFJyJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=smoch@web.de header.b=V1nRFuyR; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=smoch@web.de header.b="V1nRFuyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784276470; x=1784881270; i=smoch@web.de;
	bh=CLuw4SqcZi1lEKlD9DTjJE+cjzVv2f5SqYtEO7/zL04=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=V1nRFuyRHoHgosl5EwM9oOPMT7qdQZQaAalPseY4+O9W+QOHO3YNY3k7zQs/i02Z
	 qYhm7DJ6sCV7+ic5oZLjXGFPJ4zvOCXaiZOcQEr6usVn7cv0y0XVxYVkgOAIJICwY
	 /gqoSdSg2/5HtADqle8JOk7ygQA28I5Rv4HHh4nKtY/TeDX3BAdn6wvl0QgXCnlra
	 TTAh0FHaobdMsjiN4Kh8MmB6vhXz3KpuNOPn7xzCpGu/obH3dIHA6jBb0yfeJBJe8
	 Jt4XJ7vk8cASNqZn5U/v4VELPmQ8vNOetM4FDN4xo4emz30uSomxTS6SqhvbcA7mn
	 qLbBFGY7WzEp+zFAzg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MFJnX-1wmYbW10gL-00566c; Fri, 17
 Jul 2026 10:15:35 +0200
Message-ID: <8cb386d1-32b4-486f-a2b9-86cf9d46a3e8@web.de>
Date: Fri, 17 Jul 2026 10:15:33 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: imx6: Keep i.MX6Q Root Port MSI capability with
 iMSI-RX to work around hardware bug
To: hongxing.zhu@oss.nxp.com, frank.li@nxp.com, l.stach@pengutronix.de,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 robh@kernel.org, bhelgaas@google.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Richard Zhu <hongxing.zhu@nxp.com>
References: <20260717033203.2965045-1-hongxing.zhu@oss.nxp.com>
Content-Language: en-US, de-DE
From: Soeren Moch <smoch@web.de>
In-Reply-To: <20260717033203.2965045-1-hongxing.zhu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LUKVP4XMMHrPv8SLWRbxJn+jn8rRVrD7hIU2qpLlUwnarsij/Yh
 /ARg8XGPf+r5aNfHWYSUtfvgJNAWPYinoF/CmqXeauR0+sU5mVWbnFDJiXV2+OAvOumeyV0
 yt/6bhRyPeV2yQR1SiERvQmwxoMF0Xt7FcesstI9NNDcQFtIMy+24bHUeaTMlXL06mePENw
 CRpbim0gTxCmq9pvVW6cg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6Jb2ceS2+do=;8j7S+yS4ha9BraNbZCVPsApm/1j
 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

On 17.07.26 05:32, hongxing.zhu@oss.nxp.com wrote:
> From: Soeren Moch <smoch@web.de>
>
> On some NXP chipsets, disabling Root Port MSI/MSI-X Capabilities blocks
> MSIs originating from Endpoints from reaching the iMSI-RX controller.
>
> To address this hardware bug, commit 3a4e8302e72f ("PCI: imx6: Keep Root
> Port MSI capability with iMSI-RX to work around hardware bug") preserves
> Root Port MSI and MSI-X Capabilities on i.MX7D, i.MX8MM, and i.MX8MQ
> when iMSI-RX is in use.
>
> The same applies to i.MX6Q, i.MX6QP and i.MX6SX. So preserve Root Port
> MSI/MSI-X Capabilities there as well.
>
> Note that preserving these Capabilities means Root Port-originated MSIs
> such as AER and PME won't be received due to separate hardware limitatio=
ns.
> Users may need to use workarounds such as passing the 'pcie_pme=3Dnomsi'
> command-line parameter.
>
> Fixes: f5cd8a929c825 ("PCI: dwc: Remove MSI/MSIX capability for Root Por=
t if iMSI-RX is used as MSI controller")
> Cc: <stable@vger.kernel.org> # 7.0+
> Signed-off-by: Soeren Moch <smoch@web.de>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Acked-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> ---
> changes in v3:
> - Extend the fix to i.MX6QP and i.MX6SX variants as well.
> - Update the commit descriptions suggested by Bjorn.
Thanks Richard for checking 6QP and 6SX platforms and extending the fix=20
for them.

Soeren
>
> changes in v2:
> - collect a-b and r-b tags
> - use correct fixes tag (Manivannan)
>    (reference commit that introduced the bug, not the incomplete fix)
> ---
>   drivers/pci/controller/dwc/pci-imx6.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/control=
ler/dwc/pci-imx6.c
> index 98e1db751132a..dba27eac6bff6 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1995,7 +1995,8 @@ static const struct imx_pcie_drvdata drvdata[] =3D=
 {
>   		.flags =3D IMX_PCIE_FLAG_IMX_PHY |
>   			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>   			 IMX_PCIE_FLAG_BROKEN_SUSPEND |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>   		.dbi_length =3D 0x200,
>   		.gpr =3D "fsl,imx6q-iomuxc-gpr",
>   		.ltssm_off =3D IOMUXC_GPR12,
> @@ -2011,7 +2012,8 @@ static const struct imx_pcie_drvdata drvdata[] =3D=
 {
>   		.flags =3D IMX_PCIE_FLAG_IMX_PHY |
>   			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>   			 IMX_PCIE_FLAG_SKIP_L23_READY |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>   		.gpr =3D "fsl,imx6q-iomuxc-gpr",
>   		.ltssm_off =3D IOMUXC_GPR12,
>   		.ltssm_mask =3D IMX6Q_GPR12_PCIE_CTL_2,
> @@ -2026,7 +2028,8 @@ static const struct imx_pcie_drvdata drvdata[] =3D=
 {
>   		.flags =3D IMX_PCIE_FLAG_IMX_PHY |
>   			 IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND |
>   			 IMX_PCIE_FLAG_SKIP_L23_READY |
> -			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND,
> +			 IMX_PCIE_FLAG_SUPPORTS_SUSPEND |
> +			 IMX_PCIE_FLAG_KEEP_MSI_CAP,
>   		.dbi_length =3D 0x200,
>   		.gpr =3D "fsl,imx6q-iomuxc-gpr",
>   		.ltssm_off =3D IOMUXC_GPR12,

