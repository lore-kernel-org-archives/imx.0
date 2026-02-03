Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2693358B7
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 12:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122335; cv=none; b=DTWDdFIiYPkOaGat07v0X0dDD6ee0QomwO0BdpUM5wfQia6qRgQ/D/zMklHaRfYewb87HUIXSJrMPF1xL9tRmSGnFdtKZTU5R3ZdEkgG2b5PM3sxU+J6gUZXFDzcYM0GVhzN7p4oq4otrxiBIjWAiQMxJmOVvjeYp8rZX2bnT5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122335; c=relaxed/simple;
	bh=efsv/pEW9D5VK25IqLfgOMRqmsLRDL+FNNQumDXeYrs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=AEhwZMevRMqZcPbMYw50tplqCQSSyRKeTSEWPWbfcMt/MsJhxcAAYMCGbSPSUkYAarL8Bue8X0jmDVgeRFrAVtGhhdlqPAgV6DjP6jwIqz35g8xDU+LqDYdv4lbKgEKRpIX7NzYTVtpkGLTXHhU8BPjldBOZhS2qYp5UbcgntTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JU0wDFRa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JU0wDFRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770122332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Bqvn6M0Ht7rtJgfBoDGVfSa2Ak1URJiUtnr6GHIljuc=;
	b=JU0wDFRaG88bFR75Gc/c8Lw7hs3l0QQn1Wd2xc5882BzaU2I7a8rsloPnj+FLVTK4TIYuj
	vjaBPnoHIvyb8E6/d7pawjmT4KN3iMP4inVwkbc5zhmlrFoVYJYLElu2gTWUqoC6lW6/gB
	mGyIlQzUiP2YcqhQ4q8aURYYnbLN/gs=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-3p7nUcn0PhC3WHze-4A1YQ-1; Tue, 03 Feb 2026 07:38:51 -0500
X-MC-Unique: 3p7nUcn0PhC3WHze-4A1YQ-1
X-Mimecast-MFC-AGG-ID: 3p7nUcn0PhC3WHze-4A1YQ_1770122330
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b83c3dd2092so586381466b.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 04:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122330; x=1770727130;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LbQBBbVCLYemf9DoIdcP8e631qoC+n0erfLRmUwOYuY=;
        b=FcXFPJXZCL/s35IiuZJD2LDOaW8dfviK38zK7ezdMFFwIcOpL3d/LXWqMxl3WW/WnC
         eBla3SC7P4M85MwZLNIwBM8Roop8JrSNqav+4mX/3EayDHGv0OhCS9RjlvQEqybPKwr4
         DCh+blLDSfBiI31p/T63LViWM577WLtDymmTqHTm/Q1jqica6qMUChAi4uWAANCF4rsf
         1dA1Hlb3ACW5E1xOI4m/3rG3ykWaD6dpgwSFY9JaKHtJoJd7hYBUFwaccvhWragAAAs6
         iPRAqwevrcccHXK0JGYlfw457mFArFNL9wQHx8ZvWvHPKP6MANQMIThiwWSq87RFFbPn
         ExqA==
X-Forwarded-Encrypted: i=1; AJvYcCWZ24wblxJEsM9ooIdl/SBYTHqn6Ksxn2HEN1vHuqNAJWEJQaFDdb24mWOLdugBZHobwT0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC37TEZGH9bCIdJcXgTXrVdfAUmugevm/YOSKw4pTZ14QEuS9Q
	tpLJP2lfH4OVAKDFY6C6pNYhu+AmYiZs8j3QuJmOM/zx7CW3XTN0amPAFz2ChJZrhBghf48WD4I
	n5jXRlsF6lg1yTP9V56ydANNT1GLaqfhD1VDyzxLaYvR1LWWSEPDEpw==
X-Gm-Gg: AZuq6aKEMpiMIiRPyZ+c6b2VnkmOTLYr6v2d8N8j4Y0BtCoz/Kz72PJosqW/OfNujSg
	STfYkcvtEUqt/voG5cg4TRn0bcJdQHJcj/Q9AKkBA3qisDNfL/rys0lhF+L53zQOPMkTVVEynV/
	zZfzHJ/Fct42DpBA45nLNeSFaF+4oy6g/0fm9ZBx3H4sDdM9omov7E0mSNiXBeAk5KSVfzMXCfO
	6Ni6YFhi82Ep8gYU+V1mtMMpParkCWz+wMbai1ZHbIWCzqeI4ghVeYufR9+b3gqX2AhW7aN+DhP
	00L2aJgOSOK0Y9UuC9NvhNNuO6LFhcbaMGmZPu4r4yGP/vE69Cz8mDtDGTTgqIzGZZoWP1zrj3t
	zLnELFoOivTeem/7oJBQ0NSH2pqTtO5WHYCbD
X-Received: by 2002:a17:906:c10f:b0:b88:411c:fcbf with SMTP id a640c23a62f3a-b8dff506ec8mr944488966b.12.1770122329645;
        Tue, 03 Feb 2026 04:38:49 -0800 (PST)
X-Received: by 2002:a17:906:c10f:b0:b88:411c:fcbf with SMTP id a640c23a62f3a-b8dff506ec8mr944485766b.12.1770122329039;
        Tue, 03 Feb 2026 04:38:49 -0800 (PST)
Received: from alrua-x1.borgediget.toke.dk (alrua-x1.borgediget.toke.dk. [2a0c:4d80:42:443::2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc6995sm1011619066b.24.2026.02.03.04.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 04:38:48 -0800 (PST)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id E3EFC4D0E25; Tue, 03 Feb 2026 13:38:47 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Larysa Zaremba <larysa.zaremba@intel.com>
Cc: bpf@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Wei Fang <wei.fang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer
 <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Stanislav
 Fomichev <sdf@fomichev.me>, Andrii Nakryiko <andrii@kernel.org>, Martin
 KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, KP
 Singh <kpsingh@kernel.org>, Hao Luo <haoluo@google.com>, Jiri Olsa
 <jolsa@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan
 <shuah@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>,
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, "Bastien Curutchet
 (eBPF Foundation)" <bastien.curutchet@bootlin.com>, Tushar Vyavahare
 <tushar.vyavahare@intel.com>, Jason Xing <kernelxing@tencent.com>,
 =?utf-8?Q?Ricardo_B=2E_Marli=C3=A8re?= <rbm@suse.com>, Eelco Chaudron
 <echaudro@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 imx@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-kselftest@vger.kernel.org,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: Re: [PATCH bpf 1/6] xdp: produce a warning when calculated tailroom
 is negative
In-Reply-To: <aYHqtxtg3uNXO668@soc-5CG4396X81.clients.intel.com>
References: <20260203105417.2302672-1-larysa.zaremba@intel.com>
 <20260203105417.2302672-2-larysa.zaremba@intel.com>
 <87zf5q109e.fsf@toke.dk>
 <aYHqtxtg3uNXO668@soc-5CG4396X81.clients.intel.com>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 03 Feb 2026 13:38:47 +0100
Message-ID: <87o6m60zoo.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kB-yCOKzuUnp-xZjwFgLZtR7mnLD5sNx5KR1CnfQD64_1770122330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Larysa Zaremba <larysa.zaremba@intel.com> writes:

> On Tue, Feb 03, 2026 at 01:26:21PM +0100, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Larysa Zaremba <larysa.zaremba@intel.com> writes:
>>=20
>> > Many ethernet drivers report xdp Rx queue frag size as being the same =
as
>> > DMA write size. However, the only user of this field, namely
>> > bpf_xdp_frags_increase_tail(), clearly expects a truesize.
>> >
>> > Such difference leads to unspecific memory corruption issues under cer=
tain
>> > circumstances, e.g. in ixgbevf maximum DMA write size is 3 KB, so when
>> > running xskxceiver's XDP_ADJUST_TAIL_GROW_MULTI_BUFF, 6K packet fully =
uses
>> > all DMA-writable space in 2 buffers. This would be fine, if only
>> > rxq->frag_size was properly set to 4K, but value of 3K results in a
>> > negative tailroom, because there is a non-zero page offset.
>> >
>> > We could return -EINVAL and be done with it in such case, but due to
>> > tailroom being stored as an unsigned int, it is reported to be somewhe=
re
>> > near UINT_MAX, resulting in a tail being grown, even if the requested
>> > offset is too much (it is around 2K in the abovementioned test). This =
later
>> > leads to all kinds of unspecific calltraces.
>> >
>> > [ 7340.337579] xskxceiver[1440]: segfault at 1da718 ip 00007f4161aeac9=
d sp 00007f41615a6a00 error 6
>> > [ 7340.338040] xskxceiver[1441]: segfault at 7f410000000b ip 000000000=
04042b5 sp 00007f415bffecf0 error 4
>> > [ 7340.338179]  in libc.so.6[61c9d,7f4161aaf000+160000]
>> > [ 7340.339230]  in xskxceiver[42b5,400000+69000]
>> > [ 7340.340300]  likely on CPU 6 (core 0, socket 6)
>> > [ 7340.340302] Code: ff ff 01 e9 f4 fe ff ff 0f 1f 44 00 00 4c 39 f0 7=
4 73 31 c0 ba 01 00 00 00 f0 0f b1 17 0f 85 ba 00 00 00 49 8b 87 88 00 00 0=
0 <4c> 89 70 08 eb cc 0f 1f 44 00 00 48 8d bd f0 fe ff ff 89 85 ec fe
>> > [ 7340.340888]  likely on CPU 3 (core 0, socket 3)
>> > [ 7340.345088] Code: 00 00 00 ba 00 00 00 00 be 00 00 00 00 89 c7 e8 3=
1 ca ff ff 89 45 ec 8b 45 ec 85 c0 78 07 b8 00 00 00 00 eb 46 e8 0b c8 ff f=
f <8b> 00 83 f8 69 74 24 e8 ff c7 ff ff 8b 00 83 f8 0b 74 18 e8 f3 c7
>> > [ 7340.404334] Oops: general protection fault, probably for non-canoni=
cal address 0x6d255010bdffc: 0000 [#1] SMP NOPTI
>> > [ 7340.405972] CPU: 7 UID: 0 PID: 1439 Comm: xskxceiver Not tainted 6.=
19.0-rc1+ #21 PREEMPT(lazy)
>> > [ 7340.408006] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIO=
S 1.17.0-5.fc42 04/01/2014
>> > [ 7340.409716] RIP: 0010:lookup_swap_cgroup_id+0x44/0x80
>> > [ 7340.410455] Code: 83 f8 1c 73 39 48 ba ff ff ff ff ff ff ff 03 48 8=
b 04 c5 20 55 fa bd 48 21 d1 48 89 ca 83 e1 01 48 d1 ea c1 e1 04 48 8d 04 9=
0 <8b> 00 48 83 c4 10 d3 e8 c3 cc cc cc cc 31 c0 e9 98 b7 dd 00 48 89
>> > [ 7340.412787] RSP: 0018:ffffcc5c04f7f6d0 EFLAGS: 00010202
>> > [ 7340.413494] RAX: 0006d255010bdffc RBX: ffff891f477895a8 RCX: 000000=
0000000010
>> > [ 7340.414431] RDX: 0001c17e3fffffff RSI: 00fa070000000000 RDI: 000382=
fc7fffffff
>> > [ 7340.415354] RBP: 00fa070000000000 R08: ffffcc5c04f7f8f8 R09: ffffcc=
5c04f7f7d0
>> > [ 7340.416283] R10: ffff891f4c1a7000 R11: ffffcc5c04f7f9c8 R12: ffffcc=
5c04f7f7d0
>> > [ 7340.417218] R13: 03ffffffffffffff R14: 00fa06fffffffe00 R15: ffff89=
1f47789500
>> > [ 7340.418229] FS:  0000000000000000(0000) GS:ffff891ffdfaa000(0000) k=
nlGS:0000000000000000
>> > [ 7340.419489] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> > [ 7340.420286] CR2: 00007f415bfffd58 CR3: 0000000103f03002 CR4: 000000=
0000772ef0
>> > [ 7340.421237] PKRU: 55555554
>> > [ 7340.421623] Call Trace:
>> > [ 7340.421987]  <TASK>
>> > [ 7340.422309]  ? softleaf_from_pte+0x77/0xa0
>> > [ 7340.422855]  swap_pte_batch+0xa7/0x290
>> > [ 7340.423363]  zap_nonpresent_ptes.constprop.0.isra.0+0xd1/0x270
>> > [ 7340.424102]  zap_pte_range+0x281/0x580
>> > [ 7340.424607]  zap_pmd_range.isra.0+0xc9/0x240
>> > [ 7340.425177]  unmap_page_range+0x24d/0x420
>> > [ 7340.425714]  unmap_vmas+0xa1/0x180
>> > [ 7340.426185]  exit_mmap+0xe1/0x3b0
>> > [ 7340.426644]  __mmput+0x41/0x150
>> > [ 7340.427098]  exit_mm+0xb1/0x110
>> > [ 7340.427539]  do_exit+0x1b2/0x460
>> > [ 7340.427992]  do_group_exit+0x2d/0xc0
>> > [ 7340.428477]  get_signal+0x79d/0x7e0
>> > [ 7340.428957]  arch_do_signal_or_restart+0x34/0x100
>> > [ 7340.429571]  exit_to_user_mode_loop+0x8e/0x4c0
>> > [ 7340.430159]  do_syscall_64+0x188/0x6b0
>> > [ 7340.430672]  ? __do_sys_clone3+0xd9/0x120
>> > [ 7340.431212]  ? switch_fpu_return+0x4e/0xd0
>> > [ 7340.431761]  ? arch_exit_to_user_mode_prepare.isra.0+0xa1/0xc0
>> > [ 7340.432498]  ? do_syscall_64+0xbb/0x6b0
>> > [ 7340.433015]  ? __handle_mm_fault+0x445/0x690
>> > [ 7340.433582]  ? count_memcg_events+0xd6/0x210
>> > [ 7340.434151]  ? handle_mm_fault+0x212/0x340
>> > [ 7340.434697]  ? do_user_addr_fault+0x2b4/0x7b0
>> > [ 7340.435271]  ? clear_bhb_loop+0x30/0x80
>> > [ 7340.435788]  ? clear_bhb_loop+0x30/0x80
>> > [ 7340.436299]  ? clear_bhb_loop+0x30/0x80
>> > [ 7340.436812]  ? clear_bhb_loop+0x30/0x80
>> > [ 7340.437323]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>> > [ 7340.437973] RIP: 0033:0x7f4161b14169
>> > [ 7340.438468] Code: Unable to access opcode bytes at 0x7f4161b1413f.
>> > [ 7340.439242] RSP: 002b:00007ffc6ebfa770 EFLAGS: 00000246 ORIG_RAX: 0=
0000000000000ca
>> > [ 7340.440173] RAX: fffffffffffffe00 RBX: 00000000000005a1 RCX: 00007f=
4161b14169
>> > [ 7340.441061] RDX: 00000000000005a1 RSI: 0000000000000109 RDI: 00007f=
415bfff990
>> > [ 7340.441943] RBP: 00007ffc6ebfa7a0 R08: 0000000000000000 R09: 000000=
00ffffffff
>> > [ 7340.442824] R10: 0000000000000000 R11: 0000000000000246 R12: 000000=
0000000000
>> > [ 7340.443707] R13: 0000000000000000 R14: 00007f415bfff990 R15: 00007f=
415bfff6c0
>> > [ 7340.444586]  </TASK>
>> > [ 7340.444922] Modules linked in: rfkill intel_rapl_msr intel_rapl_com=
mon intel_uncore_frequency_common skx_edac_common nfit libnvdimm kvm_intel =
vfat fat kvm snd_pcm irqbypass rapl iTCO_wdt snd_timer intel_pmc_bxt iTCO_v=
endor_support snd ixgbevf virtio_net soundcore i2c_i801 pcspkr libeth_xdp n=
et_failover i2c_smbus lpc_ich failover libeth virtio_balloon joydev 9p fuse=
 loop zram lz4hc_compress lz4_compress 9pnet_virtio 9pnet netfs ghash_clmul=
ni_intel serio_raw qemu_fw_cfg
>> > [ 7340.449650] ---[ end trace 0000000000000000 ]---
>> >
>> > The issue can be fixed in all in-tree drivers, but we cannot just trus=
t OOT
>> > drivers to not do this. Therefore, make tailroom a signed int and prod=
uce a
>> > warning when it is negative to prevent such mistakes in the future.
>> >
>> > Fixes: bf25146a5595 ("bpf: add frags support to the bpf_xdp_adjust_tai=
l() API")
>> > Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
>> > Signed-off-by: Larysa Zaremba <larysa.zaremba@intel.com>
>> > ---
>> >  net/core/filter.c | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/net/core/filter.c b/net/core/filter.c
>> > index 616e0520a0bb..9715d957e3c5 100644
>> > --- a/net/core/filter.c
>> > +++ b/net/core/filter.c
>> > @@ -4149,12 +4149,13 @@ static int bpf_xdp_frags_increase_tail(struct =
xdp_buff *xdp, int offset)
>> >  =09struct skb_shared_info *sinfo =3D xdp_get_shared_info_from_buff(xd=
p);
>> >  =09skb_frag_t *frag =3D &sinfo->frags[sinfo->nr_frags - 1];
>> >  =09struct xdp_rxq_info *rxq =3D xdp->rxq;
>> > -=09unsigned int tailroom;
>> > +=09int tailroom;
>> > =20
>> >  =09if (!rxq->frag_size || rxq->frag_size > xdp->frame_sz)
>> >  =09=09return -EOPNOTSUPP;
>> > =20
>> >  =09tailroom =3D rxq->frag_size - skb_frag_size(frag) - skb_frag_off(f=
rag);
>> > +=09WARN_ON_ONCE(tailroom < 0);
>> >  =09if (unlikely(offset > tailroom))
>> >  =09=09return -EINVAL;
>> > =20
>>=20
>> Why can't we do both? I.e., WARN_ON_ONCE() *and* return -EINVAL?
>>=20
>> -Toke
>>=20
>
> It would be redundant, offset is always >=3D 0 here, so with tailroom now=
 being a=20
> signed int, offset is always bigger and -EINVAL is returned.

Oh, I see. OK, may be worth calling out; I read this paragraph in your
commit message to mean "we don't bother returning EINVAL in this case,
we just warn":

> > We could return -EINVAL and be done with it in such case, but due to
> > tailroom being stored as an unsigned int, it is reported to be somewher=
e
> > near UINT_MAX, resulting in a tail being grown, even if the requested
> > offset is too much (it is around 2K in the abovementioned test). This l=
ater
> > leads to all kinds of unspecific calltraces.

-Toke

