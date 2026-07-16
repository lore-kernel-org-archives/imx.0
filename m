Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23B1439912
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 17:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784221761; cv=none; b=dHrEQf7UMzGh2b8eA6Kp+8624eHK3b+LGF382G0aIpZoFnLMwHi00TUwoBInRw2bdsXvYgM3bFihARKuyK2v9zgsBK7b4Gaunn5xm/+JFkBwSIIdcGnfqf1A00bpUY6HxxbJgfIzZ5OS+7uSdD5P9N1kLDjNi7nWKM+WoFTI4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784221761; c=relaxed/simple;
	bh=tEPuH0w8ovN1LWEjJQMK9Q1Z1vEJ7za/094ayvYh7Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bINIwvwNtJ3/SrPE+fA05vve5+jXJLeW4GvFD4BYXtZ+WQV6x7RymkgnPn95NikDEu68B1n30WSX+TcnDwo1S8+L+5XOIThR6A8TwBcj9ZxDJcCN3T1Wtg004wja/LzRe4uNXjOuCzjhMFu4p4VQVr1J79JbEO2uiCVY1EddQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1jdM+Gb; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1jdM+Gb"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-80a123ef90aso16517967b3.0
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 10:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784221756; x=1784826556; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=;
        b=Z1jdM+Gbk2apQajaWDsMhqHlSRkwWANhUyMdvf3bu6m5ud0shFzp6epm96T5jLbFBn
         RqIw+Cf7Me8mDFs8ajzUIvNyHtwdPeveYTluQL3yn4fiIc9WAUNKVCupOm0GQOELli6S
         2cIgtfCg6ZrwVq+2CD0iIHI+1CGDxAesH+lLdGmBL9ydEdQmFBa9UZ7FPlabzo62/vCi
         4uqo09GXEY9jzzQEEemPXTNPcZ0+E8mkiy1iLro4TDw19m02S4q3zAd5jIzpZui22W6y
         hj9hEkQYmXMlVinZVmnN5fq1SpKG0VSRWiFxAlC7mrAP1haEF/X745OnRDsBAW4VCnsv
         TmkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784221756; x=1784826556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=519dNdxGkZChACNROtarKLrXjiSKkCZfa7q39zzxKTI=;
        b=YnVJd5CstVZoW3mN90s4+bbT3mKTIemBHY/viStXb876bur0oyByn7zIwRgvQVuJ5N
         EeKi8g5+BMEixJt2JUhRd/T5JYf1dAQksGoITulMdXECQt2Rg6NlnXFnf0oa+M7SXnAd
         4zQjSfhpHQ0OKr6V5vKc21pPnhr36hIdNvstU0rImRDx+JUdvwRWWDooCbmpovhu54IX
         wCN6ScMKPxNVDfKugdxnQD5JXm263xDkgHg0tUpUNJR9Tlp07l98B+oFpiDaPNlXUgQD
         5fg8zxcJoInfjJkFp3fcNVWURgPWniwClsOPma8cjxZSJc/goF2JqUOfPSxF8y9VtwVQ
         IA3w==
X-Forwarded-Encrypted: i=1; AHgh+Rr3+M6r1LsLDRrKTZS2bZbLoIcMfTAJVzOwVBSbwlfj5ER5+glcqPYfWwl2cilfKZnhnQQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtbJ2nSXUal31tZB236I6ytXB3TXACzy9OkyBxv0+aeoWmLytE
	vFULHsE3A9+V1VpR6mxkvIl3vxnc1bsXoEg4wtGBneZVYMZxJt7sG2dG
X-Gm-Gg: AfdE7clPOu+DXdbfa/E1uHzzcszRQv0zC7JA2r4EyyOsG0Mblp/03gdzqKzzncPazM3
	McTtkgvlJ5c4b11ljIZ+89/zeGZDD2ATEpDwSH4zxpP3AVl9SyzMLvRZJMo23F3dtowhCiQlLNt
	NlU3u7jHlKk/o0u7P4S/Et+Hab51pGfiFezQomhENEqU13ME51PjbQOZPI4Tvp0CHNNsKSLQCDm
	5/UgIlnGtXbyIzsuVxMin0V4wEppylzhqbZHNdG9tHfWbfQd1eAsbD7gKBhhYhqSCyEI913PMA9
	mAeCaxhPV0mnLMaDps4AfLTWmBhHF04+5Z+sOz9Om2Wpo6+zpWOu5FqIvEicSc28FPngLew3Gu9
	tSS7YmMv1R+8q58lLd5J+88Lf/lUUgMiQqYWEOZqg4py+rI2nD///G9tuUIUPp1YNOhDQ0kEEcw
	/blqIbpuR1nIbbQKzhz+/IDPPzDGHWUpqHl66jzTsDqp4zJC8b0PqP2FtgAD3aVakraArC4w==
X-Received: by 2002:a05:690c:6983:b0:81e:429f:24ba with SMTP id 00721157ae682-81ee298087bmr22881717b3.36.1784221756342;
        Thu, 16 Jul 2026 10:09:16 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c249b87sm199484877b3.49.2026.07.16.10.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:09:15 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:09:08 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: "Hongxing Zhu (OSS)" <hongxing.zhu@oss.nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "leonardo.costa@toradex.com" <leonardo.costa@toradex.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, Sherry Sun <sherry.sun@nxp.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Hongxing Zhu <hongxing.zhu@nxp.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [REGRESSION] mainline/master: Apalis iMX6 no longer boots
Message-ID: <i6x6wpua7wlwmdq3hitoo53wkptgp62tvegmkabcru3d54eqg3@yk4eehwaarn2>
References: <20260629143439.361560-1-leoreis.costa@gmail.com>
 <20260715234736.GA288957@bhelgaas>
 <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB1200862BE9B7C137EC7C18AF18CC72@VI0PR04MB12008.eurprd04.prod.outlook.com>

On Thu, Jul 16, 2026 at 02:15:42AM +0000, Hongxing Zhu (OSS) wrote:
> Hi Leonardo,
> 
> Would you be able to test this patch on your affected boards? Your testing
> would help expedite the merge process and ensure the fix resolves the boot
> issue you're experiencing.
> 
> Best Regards
> Richard Zhu

Hi Richard,

Sorry for taking long to respond, I was caught up with something. I
tested the patch and it solved the issue. I sent a Tested-by tag there.
Thanks for looking into this!

Best Regards
Leonardo
