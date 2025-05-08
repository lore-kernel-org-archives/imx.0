Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF4B4B1E7D
	for <imx@lists.linux.dev>; Thu,  8 May 2025 18:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746729378; cv=none; b=MjAsSeH56NymyNO+x+yuj0BzJbPZwmx9KE7yXk+yDs+Iejj+4YQSTXeo1MJbYB1s/LJ5jNBxNPT81xzGj9Qa52ivsnSr4uX+mKYJT1MdIIsVlpNbwtqQuH++kwWtEhih7PJqpp9E8B1rjk+bmWXlcuWMr4JUc7G9WQ6IYgVhHsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746729378; c=relaxed/simple;
	bh=8qRcaObsbkV3dzahO6i44klrpzR4rTo+K2qGz94TNdc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zc477pltpz3U4uwRkwA48rlyLbTqr9GH3EwkUhYcbVQAssIfoZlArRjwbTqXseTUa/vLUlmlufTmcU/7RiK2a2RLneFrkQB2mLJzNY9mJl5Y081EyIvU6I7JFoV1FYtkc16McAOMwsL2b+pB+A3CpBeNH9vkk9c4pHHXscnPJwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-52403e39a23so776334e0c.2
        for <imx@lists.linux.dev>; Thu, 08 May 2025 11:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746729374; x=1747334174;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rYgnp2PSg9KL11tldQ485cPxrLluqoPttc4PhTteUa8=;
        b=e3ioaSKdYEWcr+5qpelX87SAm6mRAuC+j7Biau6R5686yfn7v7s/MyMIu7N7rkpal5
         rmURzYuMTOODlWVHtOo1ly69Elliv9149bYvjeCl1qpVryq647HRW8nwWIuneHZNvDU7
         UziOowOnU+eWMFIlWa5n3J1LbgUsrrx08L9vxWkLuJLiM1hDC4T0S8/E74IXurDK1XdK
         3tIEj8fNne3kWPEkF6q+5Do30D17sfiVGc9CGKuagEn0XqeOZ9qz+5PwMiTu6Om20DZx
         SI9uCkKcloP+RkQwCgu1qAWDyE+Pt2uiyV/KcjXkO70nqtEiyi0zzQFd4nnZs+K+vIuO
         cH4A==
X-Forwarded-Encrypted: i=1; AJvYcCXBqM08rGZdIAZKqN5WZ+xLFSt0CEbW8tFoQhGGr8R4kCzJyHT5QUZ/haxomz0sjVMPRJE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxSkTJe9OL+5oIr0w3sEk5ei1yyANSfeFfiiWsPfKzQYES9/Yke
	mGixnb3kFutF/HamgRmreKk5ERVwkYNiYIdo1TDCOKUe7oaZPSqNjSpNjGUB
X-Gm-Gg: ASbGncsVc3jjSQRqKibP1HGQTwEMDvB79/PYbELMiucLGfm59+0R1S8SFwLGZCzU1qD
	pJEZHmWBZfu7WZWCX7AR7RGFFKoAhyv+6L1IOZPRPaUgDC7HlH3s60kH0Lch5odfx0HR3XKmdy1
	ZJH/+iDSVz7X5bho2NBghSWGlkJuxEVjaIhtVt9Lp5aUYyy94fbr6UJd3U2hvY3yU7j7zrWU+o6
	Hhv8jYyTDLI7IpBr5opwFi6ps/7TowSgCvhuOXyXa/1xzFbWj/0NW16F74fy6hWyF++vh8SnUdV
	o3UFS89RtVrEx1en57bDAHeqsHSIpNhNFrgYFIyKVTZ8zECrGKPnvB4Pog6U+hWiYoDMqQEK63W
	Z1TeElqc=
X-Google-Smtp-Source: AGHT+IF3aKly6WW3+DtM0ql6ARgzHZuAPZgc1WUWcI1WlSMytPna5K9PBb7H8KHyVfYmLJa0VEvx1Q==
X-Received: by 2002:a05:6122:828d:b0:520:62ce:98ed with SMTP id 71dfb90a1353d-52c53d2ff33mr1075733e0c.6.1746729374612;
        Thu, 08 May 2025 11:36:14 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c536ff4dcsm156703e0c.9.2025.05.08.11.36.12
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 11:36:12 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-523ffbe0dbcso1000573e0c.0
        for <imx@lists.linux.dev>; Thu, 08 May 2025 11:36:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUP0/t4yc6pREnEIM6y8pqabG4rD5FMVc0RFCHg2APHGWiNDuTXQJBa3OdX+lT4G/Y9H4=@lists.linux.dev
X-Received: by 2002:a67:e7cc:0:b0:4dd:b037:d23d with SMTP id
 ada2fe7eead31-4deed36f9ddmr542907137.12.1746729371961; Thu, 08 May 2025
 11:36:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250507071315.394857-1-herve.codina@bootlin.com>
 <20250507071315.394857-13-herve.codina@bootlin.com> <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
In-Reply-To: <aBz4gxUlnSgEtHn8@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 20:35:57 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWe9XKDvszbkz9jx=qcyLufFMnoG3BcTpbyay6cQZAJ0A@mail.gmail.com>
X-Gm-Features: AX0GCFvrzDOY8sW8kwNxuZ1_3pAgsil5zL802IfBcD5409O6It8refjLWt5eRkA
Message-ID: <CAMuHMdWe9XKDvszbkz9jx=qcyLufFMnoG3BcTpbyay6cQZAJ0A@mail.gmail.com>
Subject: Re: [PATCH v2 12/26] PCI: of: Set fwnode device of newly created PCI
 device nodes
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Wolfram Sang <wsa@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Allan Nielsen <allan.nielsen@microchip.com>, 
	Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 20:32, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Wed, May 07, 2025 at 09:12:54AM +0200, Herve Codina wrote:
> > Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> > node are created and filled based on PCI core information but the
> > fwnode device field is not set.
> >
> > When later an overlay is applied, this consuses fw_devlink. Indeed,
>
> consuses?

confuses

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
